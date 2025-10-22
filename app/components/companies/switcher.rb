class Components::Companies::Switcher < Components::Base
  def initialize(companies, current_company = nil)
    @companies = companies
    @current_company = current_company
  end

  def view_template
    return if @companies.blank?

    CommandDialog do
      div(data: {ruby_ui__command_target: "input"})

      CommandDialogTrigger do
        Button(variant: "outline", class: "w-56 pr-2 pl-3 justify-between") do
          div(class: "flex items-center space-x-1") do
            Components::Icon("magnifying-glass")
            span(class: "text-muted-foreground font-normal") do
              @current_company.blank? ? t(".change") : @current_company.name
            end
          end
        end
      end

      CommandDialogContent do
        Command do
          CommandInput(placeholder: t(".search_placeholder"))
          CommandEmpty { t(".not_found") }
          CommandList do
            CommandGroup(title: tmp(Company)) do
              @companies.each do |company|
                CommandItem(value: company.name, href: current_company_path(company.pid)) do
                  Components::Icon("arrows-left-right")
                  plain company.name
                end
              end
            end
          end
        end
      end
    end
  end
end
