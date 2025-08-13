class Components::Navbar::Title < Components::Base
  def view_template
    div(class: "font-bold text-lg") { "Minha App" }
  end
end
