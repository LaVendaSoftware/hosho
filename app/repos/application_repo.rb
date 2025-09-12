class ApplicationRepo
  DEFAULT_LIMIT = 30

  delegate :count, :limit, :find_by, :find_by!, :pluck, :any?, :all, :all?, to: :collection

  def initialize(collection)
    @collection = collection
  end

  def build(attributes = {})
    all.new(attributes)
  end

  def paginate(page: 1, limit: DEFAULT_LIMIT)
    @collection = all # .page(page).per(limit.presence || DEFAULT_LIMIT)
  end

  def none
    @collection = collection.none

    self
  end

  private

  attr_reader :collection
end
