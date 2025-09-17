module ApplicationHelper
  def app_name
    ENV.fetch("APP_NAME", "Hosho")
  end
end
