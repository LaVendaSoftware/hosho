class Components::PageTitle::Base < Components::Base
  include Phlex::Rails::Helpers::ContentFor

  def initialize(title, icon: nil, link: nil, back_url: nil)
    @title = title
    @icon = icon
    @link = link
    @back_url = back_url
  end

  def view_template
    content_for(:title, @title)

    header(class: header_classes) do
      div(class: "flex w-full items-center gap-1 px-4 lg:gap-2 lg:px-6") do
        Components::LinkTo::Back(@back_url)

        Components::Icon(@icon)
        Heading(level: 1, size: 4) { @title }

        div(class: "ml-auto") { Components::LinkTo::New(@link) }
      end
    end
  end

  private

  def header_classes
    [
      "flex h-(--header-height) shrink-0 items-center gap-2 border-b transition-[width,height] ",
      "ease-linear group-has-data-[collapsible=icon]/sidebar-wrapper:h-(--header-height)"
    ]
  end
end
