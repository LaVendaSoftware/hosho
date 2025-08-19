class Components::Flashes::Warning < Components::Flashes::Base
  def initialize(message:)
    @message = message

    super(message:, variant: :warning, title: "⚠️ Warning", icon: nil)
  end
end
