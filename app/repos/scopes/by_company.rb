module Scopes
  module ByCompany
    def by_company(company_id)
      @collection = collection.where(company_id:)

      self
    end
  end
end
