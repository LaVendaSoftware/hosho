class Components::Alerts::NotFound::Base < Components::Base
  def initialize(model:, gender:)
    @model = model
    @gender = gender
  end

  def view_template
    Components::Alerts::Warning(message:)
  end

  def message = I18n.t("components.alerts.not_found.#{@gender}", model: h.tm(@model).downcase)
end
