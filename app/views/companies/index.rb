class Views::Companies::Index < Views::Base
  def initialize(companies:)
    @companies = companies
  end

  def view_template
    div(class: "flex mb-4") do
      div(class: "flex-1") { Components::Page::Title(title: "Companies") }
      Components::LinkTo::New("New company", new_company_path)
    end

    return render(Components::Flashes::Warning.new(message: "Companies not found")) unless @companies.exists?

    div(id: "companies") do
      Table do
        TableCaption { "Companies" }
        TableHeader do
          TableRow do
            TableHead { "Name" }
            TableHead { "NIF" }
            TableHead { "Industry" }
            TableHead { "Disabled?" }
            TableHead(class: "text-right") { "Role" }
          end
        end

        TableBody do
          @companies.each do |company|
            TableRow do
              TableCell(class: "font-medium") { company.name }
              TableCell { company.nif }
              TableCell { company.industry }
              TableCell { Components::Boolean::String(company.disabled?) }
              TableCell(class: "text-right") do
                Components::LinkTo::Edit(edit_company_path(company))
                # Components::LinkTo::Destroy(company_path(company))
              end
            end
          end
        end

        # TableFooter do
        #   TableRow do
        #     TableHead(class: "font-medium", colspan: 3) { "Total" }
        #     TableHead(class: "font-medium text-right") { @companies.size }
        #   end
        # end
      end
    end
  end
end
