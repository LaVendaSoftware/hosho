module Authorizations
  module Developer
    extend ActiveSupport::Concern
    include Authorizations

    private

    def allowed? = Current.user.developer?
  end
end
