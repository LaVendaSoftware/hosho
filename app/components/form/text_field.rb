class Components::Form::TextField < Components::Base
  def initialize(form, attribute, **options)
    @form = form
    @attribute = attribute
    @options = options
  end

  def view_template
    div(class: "grid mb-4") do
      span { @form.label(@attribute, class: label_classes) }
      span { input }

      if @form.object.errors.messages[@attribute].present?
        span(class: "text-red-500 italic") { @form.object.errors.full_messages_for(@attribute).to_sentence }
      end
    end
  end

  private

  def input
    @form.text_field(@attribute, class: input_classes, **@options)
  end

  def label_classes
    [
      "flex items-center gap-2 text-sm leading-none font-medium select-none ",
      "group-data-[disabled=true]:pointer-events-none group-data-[disabled=true]:opacity-50 ",
      "peer-disabled:cursor-not-allowed peer-disabled:opacity-50 mb-2"
    ].join
  end

  def input_classes
    [
      "file:text-foreground placeholder:text-muted-foreground selection:bg-primary ",
      "selection:text-primary-foreground dark:bg-input/30 border-input flex ",
      "h-9 w-full min-w-0 rounded-md border bg-transparent px-3 py-1 text-base ",
      "shadow-xs transition-[color,box-shadow] outline-none file:inline-flex ",
      "file:h-7 file:border-0 file:bg-transparent file:text-sm file:font-medium ",
      "disabled:pointer-events-none disabled:cursor-not-allowed disabled:opacity-50 ",
      "md:text-sm focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] ",
      "aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive"
    ].join
  end
end
