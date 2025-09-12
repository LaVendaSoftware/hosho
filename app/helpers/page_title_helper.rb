module PageTitleHelper
  def page_title
    [
      content_for(:turbo_native_title).presence ||
        content_for(:page_title).presence ||
        content_for(:title).presence,
      app_name
    ].compact.join(" » ")
  end

  def platform_identifier
    return "turbo-native" if turbo_native_app?

    DEFAULT_PLATFORM
  end
end
