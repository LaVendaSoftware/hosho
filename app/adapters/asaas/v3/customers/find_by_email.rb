module Asaas::V3::Customers
  class FindByEmail < Asaas::Base
    # Initializes Asaas::V3::Customers::Post
    #
    # Example:
    #   customer = Asaas::V3::Customers::FindByEmail.call("walmir@walmir.dev")
    def initialize(email)
      @email = email
    end

    def call
      @response = get(path: customers_path(email: @email))

      self
    end
  end
end
