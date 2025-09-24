class Components::Companies::Switcher < Components::Base
  def initialize(companies, current_company_pid = nil)
    @companies = companies
    @current_company_pid = current_company_pid
  end

  def view_template
    return if @companies.blank?

    div(class: "my-4") do
      select(class: select_classes) do
        @companies.each do |company|
          option(value: company.pid, selected: @current_company_pid == company.pid) { company.name }
        end
      end
    end
  end

  private

  def select_classes
    [
      "file:text-foreground placeholder:text-muted-foreground selection:bg-primary ",
      "selection:text-primary-foreground dark:bg-input/30 border-input flex h-9 w-full ",
      "min-w-0 rounded-md border bg-transparent px-3 py-1 text-base shadow-xs ",
      "transition-[color,box-shadow] outline-none file:inline-flex file:h-7 file:border-0 ",
      "file:bg-transparent file:text-sm file:font-medium disabled:pointer-events-none ",
      "disabled:cursor-not-allowed disabled:opacity-50 md:text-sm focus-visible:border-ring ",
      "focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 ",
      "dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive"
    ]
  end
end
