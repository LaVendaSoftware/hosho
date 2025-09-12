class Components::Alerts::NotFound::Base < Components::Base
  def initialize(model:, gender: :male)
    @model = model
    @gender = gender
  end

  def view_template
    Components::Flashes::Warning(message: t("alerts.not_found.#{@gender}", model: tm(@model)))
  end
end
