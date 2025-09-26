class Components::Form::TextAreaField < Components::Form::TextField
  private

  def input
    @form.textarea(@attribute, class: input_classes, **@options)
  end

  def input_classes
    [
      "flex w-full rounded-md border bg-background px-3 py-1 text-sm shadow-sm ",
      "transition-colors border-border placeholder:text-muted-foreground ",
      "disabled:cursor-not-allowed disabled:opacity-50 file:border-0 ",
      "file:bg-transparent file:text-sm file:font-medium focus-visible:outline-none ",
      "focus-visible:ring-1 focus-visible:ring-ring aria-disabled:cursor-not-allowed ",
      "aria-disabled:opacity-50 aria-disabled:pointer-events-none"
    ]
  end
end
