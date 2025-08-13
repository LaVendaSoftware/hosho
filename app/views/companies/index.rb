class Views::Companies::Index < Views::Base
  include Phlex::Rails::Helpers::ContentFor
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::Routes

  def initialize(companies:, notice:)
    @companies = companies
    @notice = notice
  end

  def view_template
    p(style: "color:#008000") { @notice }

    content_for :title, "Companies"

    h1 { "Companies" }

    div(id: "companies") do
      @companies.each do |company|
        render(Views::Companies::Company.new(company:))

        p { link_to "Show this company", company }
      end
    end

    link_to "New company", new_company_path
  end
end
