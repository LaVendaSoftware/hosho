class Components::Pagination::Links < Components::Base
  def initialize(records:)
    @records = records
  end

  def view_template
  end
end
