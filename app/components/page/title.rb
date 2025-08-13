class Components::Page::Title < Components::Base
  include Phlex::Rails::Helpers::ContentFor

  def initialize(title:)
    @title = title
  end

  def view_template
    content_for(:title, @title)

    Heading { @title }
  end
end
