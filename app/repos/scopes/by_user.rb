module Scopes
  module ByUser
    def by_user(user)
      return none if user.blank?
      return self if user.developer?

      @collection = collection.where(user_id: user.id)

      self
    end
  end
end
