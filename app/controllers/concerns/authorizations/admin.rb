module Authorizations
  module Admin
    extend ActiveSupport::Concern
    include Authorizations

    private

    def allowed?
      Current.user.admin? || Current.user.developer?
    end
  end
end
