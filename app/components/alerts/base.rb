class Components::Alerts::Base < Components::Base
  def initialize(message:, title: nil)
    @message = message
    @title = title
  end

  def view_template
    return if @message.blank?

    Alert(variant:, class: "flex gap-3 items-center") do
      render(Components::Icon.new(icon))

      div do
        AlertTitle { @title } if @title.present?
        AlertDescription { @message }
      end
    end
  end

  private

  def variant
    raise NotImplementedError, "You must define ##{__method__} in #{self.class}"
  end

  def icon = nil
end
