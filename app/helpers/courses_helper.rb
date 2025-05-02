module CoursesHelper
  def course_image_url(modality)
    images = {
      "Aikido" => "https://images.pexels.com/photos/7045589/pexels-photo-7045589.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Badminton Coespe" => "https://images.pexels.com/photos/8007419/pexels-photo-8007419.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Capoeira" => "https://images.pexels.com/photos/3340318/pexels-photo-3340318.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Cross Training" => "https://images.pexels.com/photos/4944432/pexels-photo-4944432.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Deep Running" => "https://images.pexels.com/photos/3764538/pexels-photo-3764538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Funcionágua" => "https://images.pexels.com/photos/9632066/pexels-photo-9632066.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Ginástica Aeróbica" => "https://images.pexels.com/photos/4498577/pexels-photo-4498577.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Ginástica Rítmica" => "https://images.pexels.com/photos/7207114/pexels-photo-7207114.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Karate" => "https://jkabrasil.com.br/wp-content/uploads/2023/01/jka-brasil-karate-graduacao-1.jpg",
      "Kendo" => "https://images.pexels.com/photos/7045446/pexels-photo-7045446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Kung Fu" => "https://images.pexels.com/photos/7045606/pexels-photo-7045606.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Musculação" => "https://s2-oglobo.glbimg.com/tCi4YPIy6K0HBPMLGnt00WSvbrQ=/0x0:4000x2667/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2023/c/a/O7y1EGRAelLLVURwHeqQ/strong-man-training-gym.jpg",
      "Natação Avançado" => "https://images.pexels.com/photos/863988/pexels-photo-863988.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Natação Iniciante" => "https://images.pexels.com/photos/261185/pexels-photo-261185.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Sanda" => "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Lutadores_de_Wushu_competiram_em_Ceil%C3%A2ndia_pelo_t%C3%ADtulo_Brasiliense.jpg/1920px-Lutadores_de_Wushu_competiram_em_Ceil%C3%A2ndia_pelo_t%C3%ADtulo_Brasiliense.jpg",
      "Taekwondo" => "https://images.pexels.com/photos/8612015/pexels-photo-8612015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Vôlei de Quadra Avançado" => "https://images.pexels.com/photos/6203566/pexels-photo-6203566.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Vôlei de Quadra Iniciante" => "https://images.pexels.com/photos/6180458/pexels-photo-6180458.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "Xadrez" => "https://images.pexels.com/photos/6202958/pexels-photo-6202958.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    }
    images[modality] || placeholder_image_url(modality)
  end

  private

  def placeholder_image_url(modality)
    "https://placehold.co/400x250?text=#{modality}"
  end

  def enrollment_progress_class(course)
    percentage = (course.enrollments.count.to_f / course.slots.to_f) * 100
    if percentage < 50
      'success'
    elsif percentage < 80
      'warning'
    else
      'danger'
    end
  end

  def filter_courses(courses, status)
    case status
    when "active"
      courses.select { |course| course.active? }
    when "future"
      courses.select { |course| course.future? }
    when "past"
      courses.select { |course| course.past? }
    else
      courses
    end
  end
end
