class Components::Sidebar::Sidebar < Components::Base
  def view_template(&)
    ul(**attrs, &)
  end

  private

  def attrs
    {
      data_slot: "sidebar-menu",
      data_sidebar: "menu",
      class: "flex w-full min-w-0 flex-col gap-1"
    }
  end
end
