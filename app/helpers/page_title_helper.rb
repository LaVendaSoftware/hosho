module PageTitleHelper
  def page_title
    [
      content_for(:turbo_native_title).presence ||
        content_for(:page_title).presence ||
        content_for(:title).presence,
      app_name
    ].compact.join(" » ")
  end
end
