class Components::Flashes::Success < Components::Flashes::Base
  def initialize(message:)
    @message = message

    super(message:, variant: :success, title: "🎉 Successful", icon: nil)
  end
end
