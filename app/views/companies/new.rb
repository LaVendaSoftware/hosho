class Views::Companies::New < Views::Base
  def initialize(company:)
    @company = company
  end

  def view_template
    Components::Page::Title(title: tm(Company))

    render(Views::Companies::Form.new(company: @company))
  end
end
