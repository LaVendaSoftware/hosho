class Components::PageTitle::Show < Components::Base
  def initialize(record:, back_url: nil, icon: nil)
    @record = record
    @back_url = back_url
    @icon = icon
  end

  def view_template
    Components::PageTitle::Base(title, back_url: @back_url, icon: @icon)
  end

  private

  def title
    h.tmb(@record.class, @record.new_record? ? "create" : "update")
  end
end
