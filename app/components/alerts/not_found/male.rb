class Components::Alerts::NotFound::Male < Components::Alerts::NotFound::Base
  def initialize(model:)
    super(model:, gender: "male")
  end
end
