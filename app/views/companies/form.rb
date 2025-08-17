class Views::Companies::Form < Views::Base
  include Phlex::Rails::Helpers::FormWith

  def initialize(company:)
    @company = company
  end

  def view_template
    form_with(model: @company) do |form|
      section(class: "w-3xl") do
        Components::Form::TextField(@company, :name)

        Components::Form::TextField(@company, :nif)

        FormField do
          FormFieldLabel(for: "company_industry") { "Industry" }
          Input(id: "company_industry", name: "company[industry]")
          FormFieldError { @company.errors.full_messages_for(:industry).to_sentence }
        end

        div(class: "flex gap-2 mt-4") do
          Components::LinkTo::Back(companies_path)
          Button(type: "submit") { "Create company" }
        end
      end
    end
  end
end
