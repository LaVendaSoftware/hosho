module Authorizations
  module Admin
    extend ActiveSupport::Concern
    include Authorizations

    private

    def allowed? = Current.user.staff?
  end
end
