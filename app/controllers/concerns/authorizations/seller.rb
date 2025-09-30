module Authorizations
  module Seller
    extend ActiveSupport::Concern
    include Authorizations

    private

    def allowed? = Current.user.has_permission?(:seller)
  end
end
