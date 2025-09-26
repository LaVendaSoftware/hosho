module Authorizations
  module Manager
    extend ActiveSupport::Concern
    include Authorizations

    private

    def allowed? = Current.user.has_permission?(:admin)
  end
end
