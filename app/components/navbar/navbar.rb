class Components::Navbar::Navbar < Components::Base
  def view_template
    header(class: "border-b bg-card") do
      div(class: "container mx-auto flex items-center justify-between h-14 px-4") do
        Components::Navbar::Title()

        nav(class: "flex gap-4") do
          Components::Navbar::Link(label: "Home", url: root_path)
          Components::Navbar::Link(label: "Companies", url: companies_path)
        end
      end
    end
  end
end
