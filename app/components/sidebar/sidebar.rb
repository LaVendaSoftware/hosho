class Components::Sidebar::Sidebar < Components::Base
  def view_template
    aside(class: "w-64 border-r bg-card p-4") do
      ul(class: "space-y-2") do
        li do
          Components::Navbar::Link(label: "Companies", url: companies_path)
        end
      end
    end
  end
end
