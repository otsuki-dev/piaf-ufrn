class CardCourseComponent < ViewComponent::Base
    def initialize(course:)
        @course = course
    end
    def time_left_in_words
        time_left = @course.end_date - Time.current
        case
        when time_left > 1.day
          "#{(time_left / 1.day).to_i} dias restantes"
        when time_left > 1.hour
          "#{(time_left / 1.hour).to_i} horas restantes"
        when time_left > 1.minute
          "#{(time_left / 1.minute).to_i} minutos restantes"
        else
          "Finalizado"
        end
      end
    
end
