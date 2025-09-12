class Components::Alerts::NotFound::Female < Components::Alerts::NotFound::Base
  def initialize(model:)
    super(model:, gender: "male")
  end
end
