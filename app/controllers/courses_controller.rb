class CoursesController < ApplicationController
    include CoursesHelper
    before_action :authenticate_user!, except: [:results]
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
      @enrollments = @course.enrollments.includes(:user).order(:created_at)
    
      respond_to do |format|
        format.html
    
        format.pdf do
          pdf = Prawn::Document.new
    
          # Cabeçalho com logos centralizadas
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
            column_widths: Array.new(3, pdf.bounds.width / 3.0)
          )
    
          pdf.move_down 10
    
          # Título principal
          pdf.text "Lista de Aprovados", size: 24, style: :bold, align: :center
          pdf.move_down 10
    
          # Modalidade do curso
          pdf.text "Resultados do Curso: #{@course.modality}", size: 18, style: :bold, align: :center
          pdf.move_down 10
    
          # Informações adicionais do curso
          pdf.text "DIAS E HORÁRIOS: #{@course.class_time}", size: 12, align: :center
          pdf.move_down 20
    
          # Cabeçalho da tabela
          headers = ["#", "UFRN", "Nome", "E-mail"]
    
          # Dados dos alunos
          data = @enrollments.each_with_index.map do |enrollment, index|
            [
              index + 1,  
              enrollment.user.ufrn_student ? "Sim" : "Não",
              enrollment.user.username.to_s,
              enrollment.user.email.to_s
            ]
          end
    
          # Renderização da tabela
          pdf.table([headers] + data,
                    header: true,
                    width: pdf.bounds.width * 0.9,
                    position: :center,
                    cell_style: { padding: 8 }) do
            row(0).font_style = :bold
            row(0).background_color = "DDDDDD"
            self.row_colors = ["FFFFFF", "F0F0F0"]
            self.header = true
            cells.borders = [:top, :bottom, :left, :right]
          end
    
          pdf.move_down 10
    
          # Numeração das páginas
          pdf.number_pages "Página <page> de <total>",
                           at: [pdf.bounds.right - 150, 0],
                           align: :right,
                           size: 10
    
          # Envia o PDF como resposta
          send_data pdf.render,
                    filename: "resultados_curso_#{@course.modality.parameterize}.pdf",
                    type: "application/pdf",
                    disposition: "inline"
        end
      end
    end
    
    def attendance_list
      @course = Course.find(params[:id])
      @enrollments = @course.enrollments.includes(:user).order(:created_at)
    
      respond_to do |format|
        format.pdf do
          pdf = Prawn::Document.new(page_size: 'A3', page_layout: :landscape)
    
          # Cabeçalho com logos
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
            column_widths: Array.new(3, pdf.bounds.width / 3.0)
          )
    
          pdf.move_down 10
    
          # Título principal
          pdf.text "Lista de Chamada", size: 24, style: :bold, align: :center
          pdf.move_down 10
    
          # Informações do curso
          pdf.text "Curso: #{@course.modality}", size: 18, style: :bold, align: :center
          pdf.move_down 5
          pdf.text "Período: #{@course.start_date} a #{@course.end_date}", size: 12, align: :center
          pdf.move_down 5
          pdf.text "Horário: #{@course.class_time}", size: 12, align: :center
          pdf.move_down 20
    
          # Cabeçalho da tabela
          headers = ["#", "UFRN", "Nome"]
          (1..31).each { |n| headers << n }
    
          # Dados dos alunos
          data = @enrollments.each_with_index.map do |enrollment, index|
            row = [
              index + 1,
              enrollment.user.ufrn_student ? "Sim" : "Não",
              enrollment.user.username.to_s
            ]
            31.times { row << "" }
            row
          end
    
          # Define as larguras das colunas
          column_widths = [30, 40, 150] + Array.new(31, 27)
    
          # Cria a tabela de presença
          pdf.table([headers] + data,
                    header: true,
                    column_widths: column_widths,
                    position: :center) do |table|
    
            table.row(0).font_style = :bold
            table.row(0).background_color = "DDDDDD"
    
            # Estilização das colunas de aula
            (3..33).each do |col|
              table.column(col).align = :center
              table.row(0).column(col).align = :center
              table.row(0).column(col).valign = :center
            end
    
            # Estilo das colunas iniciais
            table.column(0).align = :center
            table.column(1).align = :center
    
            # Alternância de cores nas linhas
            table.row_colors = ["FFFFFF", "F0F0F0"]
            table.cells.borders = [:top, :bottom, :left, :right]
          end
    
          # Numeração das páginas
          pdf.number_pages "Página <page> de <total>",
                           at: [pdf.bounds.right - 150, 0],
                           align: :right,
                           size: 10
    
          send_data pdf.render,
                    filename: "lista_chamada_#{@course.modality.parameterize}.pdf",
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
