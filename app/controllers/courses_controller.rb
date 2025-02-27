class CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin, except: [:index, :show, :results]
    before_action :set_course, only: [:show, :edit, :update, :destroy, :results]
  
    def index
      @courses = Course.all
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
        redirect_to admin_dashboard_path, notice: 'Curso criado com sucesso!'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @course.update(course_params)
        redirect_to @course, notice: 'Curso atualizado com sucesso!'
      else
        render :edit
      end
    end

    def destroy
      @course.destroy
      redirect_to root_path, notice: 'Curso deletado com sucesso!'
    end
  
    def enrolled_users
        @course = Course.find(params[:id])
        @enrollments = @course.enrollments.includes(:user)
    end

    # Método para gerar PDF com os resultados do curso
    def results
      @enrollments = @course.enrollments.includes(:user)
    
      respond_to do |format|
        format.html
        format.pdf do
          pdf = Prawn::Document.new
          pdf.text "Resultados do Curso: #{@course.modality}", size: 18, style: :bold
          pdf.move_down 20
    
          # Cabeçalho da tabela
          headers = ["Nome", "CPF"]
          data = @enrollments.map do |enrollment|
            [
              enrollment.user.username,
              enrollment.user.cpf
            ]
          end
    
          # Adicionar tabela ao PDF
          pdf.table([headers] + data, header: true, width: pdf.bounds.width * 0.9, cell_style: { padding: 5 }) do
            row(0).font_style = :bold
            row(0).background_color = "DDDDDD"
            self.row_colors = ["FFFFFF", "F0F0F0"]
            self.header = true
          end
    
          # Enviar o PDF como resposta
          send_data pdf.render, filename: "resultados_curso_#{@course.modality.parameterize}.pdf",
                                type: "application/pdf",
                                disposition: "inline"
        end
      end
    end

    private

    def set_course
      @course = Course.find_by(id: params[:id])
      redirect_to courses_path, alert: 'Curso não encontrado.' unless @course
    end
  
    def course_params
      params.require(:course).permit(:start_date, :end_date, :class_time, :slots, :modality, :custom_modality)
    end
  
    def require_admin
      unless current_user.admin?
        redirect_to root_path, alert: 'Acesso negado.'
      end
    end
  end