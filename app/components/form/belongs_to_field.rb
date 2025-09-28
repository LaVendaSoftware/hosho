class Components::Form::BelongsToField < Components::Form::Select
  def initialize(form, association, collection: [], **options)
    @association = association
    super(form, "#{association}_id", collection:, **options)
  end

  def errors
    return if full_messages.blank?

    span(class: "text-red-500 italic") { full_messages.to_sentence }
  end

  def full_messages
    @form.object.errors.full_messages_for(@association).presence ||
      @form.object.errors.full_messages_for(@attribute)
  end
end
