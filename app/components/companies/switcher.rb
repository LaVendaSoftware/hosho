class Components::Companies::Switcher < Components::Base
  def initialize(companies, current_company_pid = nil)
    @companies = companies
    @current_company_pid = current_company_pid
  end

  def view_template
    return if @companies.blank?

    CommandDialog do
      CommandDialogTrigger do
        Button(variant: "outline", class: "w-56 pr-2 pl-3 justify-between") do
          div(class: "flex items-center space-x-1") do
            Components::Icon("magnifying-glass")
            span(class: "text-muted-foreground font-normal") do
              t(".change")
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
                CommandItem(value: company[:name], href: company_path(company)) do
                  Components::Icon("arrows-left-right")
                  plain company[:name]
                end
              end
            end
          end
        end
      end
    end
  end
end
