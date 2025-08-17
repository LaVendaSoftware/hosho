class Views::Companies::Form < Views::Base
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::Label
  include Phlex::Rails::Helpers::Pluralize
  include Phlex::Rails::Helpers::TextField

  attr_accessor :company

  def initialize(company:)
    @company = company
  end

  def view_template
    form_with(model: company) do |form|
      section(class: "w-3xl") do
        FormField do
          FormFieldLabel(for: "company_name") { "Name" }
          Input(id: "company_name", name: "company[name]")
          FormFieldError { company.errors.full_messages_for(:name).to_sentence   }
        end

        FormField do
          FormFieldLabel(for: "company_nif") { "NIF" }
          Input(id: "company_nif", name: "company[nif]")
          FormFieldError { company.errors.full_messages_for(:nif).to_sentence   }
        end

        FormField do
          FormFieldLabel(for: "company_industry") { "Industry" }
          Input(id: "company_industry", name: "company[industry]")
          FormFieldError { company.errors.full_messages_for(:industry).to_sentence }
        end


        div(class: "flex gap-2 mt-4") do
          Components::LinkTo::Back(companies_path)
          Button(type: "submit") { "Create company" }
        end
      end
    end
  end
end
