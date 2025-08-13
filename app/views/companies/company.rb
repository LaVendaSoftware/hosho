class Views::Companies::Company < Views::Base
  include Phlex::Rails::Helpers::DOMID

  attr_accessor :company

  def initialize(company:)
    @company = company
  end

  def view_template
    div(id: (dom_id(company))) do
      p do
        strong { "Name:" }
        plain company.name
      end
      p do
        strong { "Nif:" }
        plain company.nif
      end
      p do
        strong { "Industry:" }
        plain company.industry
      end
    end
  end
end
