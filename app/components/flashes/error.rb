class Components::Flashes::Error < Components::Flashes::Base
  def initialize(message:)
    super(message:, variant: :destructive, title: "❌ Error", icon: nil)
  end
end
