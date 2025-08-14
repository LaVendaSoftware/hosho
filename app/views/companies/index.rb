class Views::Companies::Index < Views::Base
  def initialize(companies:)
    @companies = companies
  end

  def view_template
    div(class: "flex mb-4") do
      div(class: "flex-1") { Components::Page::Title(title: "Companies") }
      Components::LinkTo::New("New company", new_company_path)
    end

    return render(Flashes::Warning.new(message: "Companies not found")) unless @companies.exists?

    div(id: "companies") do
      Table do
        # TableCaption { "Employees at Acme inc." }
        TableHeader do
          TableRow do
            TableHead { "Name" }
            TableHead { "NIF" }
            TableHead { "Industry" }
            TableHead { "Disabled?" }
          end
        end

        TableBody do
          @companies.each do |company|
            TableRow do
              TableCell(class: "font-medium") { company.name }
              TableCell { company.nif }
              TableCell { company.industry }
              TableCell { Components::Boolean::String(company.disabled?) }
            end
          end
        end
        TableFooter do
          TableRow do
            TableHead(class: "font-medium", colspan: 3) { "Total" }
            TableHead(class: "font-medium text-right") { @companies.size }
          end
        end
      end
    end
  end
end
