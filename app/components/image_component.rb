class ImageComponent < ViewComponent::Base
  def initialize(src:, alt: "", class_name: "")
    @src = src
    @alt = alt
    @class_name = class_name
  end
end
