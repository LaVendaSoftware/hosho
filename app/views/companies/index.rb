class Views::Companies::Index < Views::Base
  include Phlex::Rails::Helpers::LinkTo

  def initialize(companies:)
    @companies = companies
  end

  def view_template
    Components::Page::Title(title: "Companies")

    div(id: "companies") do
      @companies.each do |company|
        render(Views::Companies::Company.new(company:))

        p { link_to "Show this company", company }
      end
    end

    link_to "New company", new_company_path
  end
end
