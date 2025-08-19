class Components::Flashes::Base < Components::Base
  def initialize(message:, variant:, title:, icon: nil)
    @message = message
    @variant = variant
    @title = title
  end

  def view_template
    return if @message.blank?

    Alert(variant: @variant, class: "mb-2") do
      span { @icon }
      AlertTitle { @title }
      AlertDescription { @message }
    end
  end
end
