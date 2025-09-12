class Components::Alerts::Error < Components::Alerts::Base
  private

  def variant = :destructive

  def icon = "warning"
end
