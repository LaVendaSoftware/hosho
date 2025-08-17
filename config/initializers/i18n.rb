Rails.application.configure do
  config.i18n.default_locale = "pt"
  config.i18n.available_locales = ["en", "pt"]
  config.i18n.load_path += Dir[Rails.root.join("config/locales/**/*.{rb,yml}").to_s]

  next if Rails.env.production?

  config.i18n.enforce_available_locales = true
  # Raises error for missing translations.
  config.i18n.raise_on_missing_translations = true
end
