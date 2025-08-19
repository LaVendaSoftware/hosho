if defined?(RailsLiveReload)
  RailsLiveReload.configure do |config|
    # config.url = "/rails/live/reload"

    # Default watched folders & files
    # config.watch %r{app/views/.+\.(erb|slim)$}
    # config.watch %r{(app|vendor)/(assets|javascript)/\w+/(.+\.(css|js|html|png|jpg|ts|jsx)).*}, reload: :always

    # More examples:
    # config.watch %r{app/helpers/.+\.rb}, reload: :always
    # config.watch %r{config/locales/.+\.yml}, reload: :always
    config.watch %r{app/assets/*/.+\.css}, reload: :always
    config.watch %r{app/components/*/.+\.rb}, reload: :always
    config.watch %r{app/components/*/.+\.erb}, reload: :always
    config.watch %r{app/views/*/.+\.erb}, reload: :always
    config.watch %r{app/views/*/.+\.erb}, reload: :always
    config.watch %r{app/views/*/.+\.rb}, reload: :always
    config.watch %r{config/locales/*/.+\.yml}, reload: :always
    # app/javascript/controllers/application.js

    config.enabled = Rails.env.development?
  end
end
