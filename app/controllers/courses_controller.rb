class CoursesController < ApplicationController
    include CoursesHelper
    before_action :authenticate_user!
    before_action :require_admin, except: [ :index, :show, :results ]
    before_action :set_course, only: [ :show, :edit, :update, :destroy, :results ]

    def index
      @status = params[:status] || "active"
      @courses = filter_courses(Course.all, @status)
    end

    def show
      @course = Course.find(params[:id])
    end

    def new
      @course = Course.new
    end

    def create
      @course = current_user.courses.build(course_params)
      if @course.save
        redirect_to admin_dashboard_path, notice: "Curso criado com sucesso!"
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @course.update(course_params)
        redirect_to @course, notice: "Curso atualizado com sucesso!"
      else
        render :edit
      end
    end

    def destroy
      @course.destroy
      redirect_to root_path, notice: "Curso deletado com sucesso!"
    end

    def enrolled_users
        @course = Course.find(params[:id])
        @enrollments = @course.enrollments.includes(:user)
    end

    def remove_enrollment
      @course = Course.find(params[:id])
      enrollment = @course.enrollments.find_by(user_id: params[:user_id])
      
      if enrollment&.destroy
        redirect_to enrolled_users_course_path(@course), notice: "Usuário removido do curso com sucesso!"
      else
        redirect_to enrolled_users_course_path(@course), alert: "Não foi possível remover o usuário do curso."
      end
    end

    # Método para gerar PDF com os resultados do curso
    def results
      @enrollments = @course.enrollments.includes(:user)
    
      respond_to do |format|
        format.html
    
        format.pdf do
          pdf = Prawn::Document.new
        
          # Cabeçalho com logos centralizadas horizontalmente
          logo_piaf = "app/assets/images/piaf.webp"
          logo_ufrn = "app/assets/images/ufrn-logo.webp"
        
          pdf.table(
            [[
              { image: logo_piaf, fit: [100, 100], position: :left },
              '',
              { image: logo_ufrn, fit: [100, 100], position: :right }
            ]],
            width: pdf.bounds.width,
            cell_style: { borders: [], padding: [0, 0, 10, 0] },
            column_widths: [pdf.bounds.width / 3, pdf.bounds.width / 3, pdf.bounds.width / 3]
          )
        
          pdf.move_down 10
        
          # Título centralizado
          pdf.text "Lista de Aprovados", size: 24, style: :bold, align: :center
          pdf.move_down 10
        
          # Subtítulo com modalidade do curso
          pdf.text "Resultados do Curso: #{@course.modality}", size: 18, style: :bold, align: :center
          pdf.move_down 20
    
          # Cabeçalho da tabela
          headers = ["Nome", "CPF"]
    
          # Dados dos alunos
          data = @enrollments.map do |enrollment|
            [
              enrollment.user.username,
              CPF.format(enrollment.user.cpf)
            ]
          end
    
          # Renderização da tabela
          pdf.table([headers] + data, 
                    header: true, 
                    width: pdf.bounds.width * 0.9, 
                    cell_style: { padding: 8 }) do
            row(0).font_style = :bold
            row(0).background_color = "DDDDDD"
            self.row_colors = ["FFFFFF", "F0F0F0"]
            self.header = true
            cells.borders = [:top, :bottom, :left, :right]
          end
    
          pdf.move_down 10
    
          # Numeração de página
          pdf.number_pages "Página <page> de <total>", 
                           at: [pdf.bounds.right - 150, 0],
                           align: :right,
                           size: 10
    
          # Envio do PDF como resposta
          send_data pdf.render,
                    filename: "resultados_curso_#{@course.modality.parameterize}.pdf",
                    type: "application/pdf",
                    disposition: "inline"
        end
      end
    end
    

    private

    def set_course
      @course = Course.find_by(id: params[:id])
      redirect_to courses_path, alert: "Curso não encontrado." unless @course
    end

    def course_params
      params.require(:course).permit(:start_date, :end_date, :class_time, :slots, :modality, :custom_modality)
    end

    def require_admin
      unless current_user.admin?
        redirect_to root_path, alert: "Acesso negado."
      end
    end
end
