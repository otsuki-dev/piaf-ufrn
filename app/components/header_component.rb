# filepath: /home/samuel/dev/piaf-ufrn/app/components/header_component.rb
class HeaderComponent < ViewComponent::Base
  def initialize(current_user:)
    @current_user = current_user
  end
end
