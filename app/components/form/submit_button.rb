class Components::Form::SubmitButton < Components::Base
  def initialize(form, label: nil, name: nil, variant: :primary)
    @form = form
    @label = label
    @name = name.presence || "commit"
    @variant = variant
  end

  def view_template
    span { @form.submit(label, name: @name, class: submit_classes) }
  end

  private

  def label
    return @label if @label.present?

    h.tmb(@form.object.class, @form.object.new_record? ? "create" : "update")
  end

  def submit_classes
    case @variant.to_s.to_sym
    when :outline then outline_button_classes
    else primary_button_classes
    end
  end

  def primary_button_classes
    [
      "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md ",
      "text-sm font-medium transition-all disabled:pointer-events-none disabled:opacity-50 ",
      "[&_svg]:pointer-events-none [&_svg:not([class*='size-'])]:size-4 shrink-0 ",
      "[&_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 ",
      "focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 ",
      "aria-invalid:border-destructive bg-primary text-primary-foreground shadow-xs ",
      "hover:bg-primary/90 h-9 px-4 py-2 has-[&gt;svg]:px-3"
    ]
  end

  def outline_button_classes
    [
      "whitespace-nowrap inline-flex items-center justify-center rounded-md font-medium ",
      "transition-colors disabled:pointer-events-none disabled:opacity-50 focus-visible:outline-none ",
      "focus-visible:ring-1 focus-visible:ring-ring aria-disabled:pointer-events-none aria-disabled:opacity-50 ",
      "aria-disabled:cursor-not-allowed px-4 py-2 h-9 text-sm border border-input bg-background shadow-sm ",
      "hover:bg-accent hover:text-accent-foreground"
    ]
  end
end
