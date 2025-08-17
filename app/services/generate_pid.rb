class GeneratePID < ApplicationService
  def initialize(prefix = nil)
    @prefix = prefix
  end

  def call
    return ULID.generate if @prefix.blank?

    [@prefix.to_s.upcase, "_", ULID.generate].join
  end
end
