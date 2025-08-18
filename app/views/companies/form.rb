class Views::Companies::Form < Views::Base
  include Phlex::Rails::Helpers::FormFor
  include Phlex::Rails::Helpers::DOMClass
  include SimpleForm::ActionViewExtensions::FormHelper

  def initialize(company:)
    @company = company
  end

  def view_template
    simple_form_for(@company) do |form|
      section(class: "w-3xl") do
        Components::Form::Input(form, :name)
        Components::Form::Input(form, :nif)
        Components::Form::EnumSelect(form, :industry)
        # Components::Form::CheckboxField(@company, :disabled)

        Heading(level: 3, class: "mt-4 mb-2") { tm(Address) }
        form.fields_for :address do |f|
          f.hidden_field(:id)

          Components::Form::Input(f, :zip_code)
          Components::Form::Input(f, :street_name)
          Components::Form::Input(f, :building_number)
          Components::Form::Input(f, :district)
          Components::Form::Input(f, :city)
          Components::Form::Input(f, :state)
          Components::Form::Input(f, :complement)
          Components::Form::Input(f, :reference)
        end

        div(class: "flex gap-2 mt-4") do
          Components::LinkTo::Back(companies_path)
          Button(type: "submit") { "Create company" }
        end
      end
    end
  end
end
