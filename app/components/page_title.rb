class Components::PageTitle < Components::Base
  def initialize(title, icon = nil)
    @title = title
    @icon = icon
  end

  def view_template
    header(class: header_classes) do
      div(class: "flex w-full items-center gap-1 px-4 lg:gap-2 lg:px-6") do
        Components::Icon(@icon)
        Heading(level: 1, size: 4) { @title }
      end
    end
  end

  private

  def header_classes
    [
      "flex h-(--header-height) shrink-0 items-center gap-2 border-b transition-[width,height] ",
      "ease-linear group-has-data-[collapsible=icon]/sidebar-wrapper:h-(--header-height)"
    ].join
  end
end
