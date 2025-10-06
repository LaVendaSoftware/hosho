module Asaas::V3::Payments
  class CreateByCustomer < Asaas::Base
    # Initializes Asaas::V3::Payments::CreateByCustomer
    #
    # Example:
    #   payment = Asaas::V3::Payments::CreateByCustomer.call("cus_000007065100")
    def initialize(customer_id)
      @customer_id = customer_id
    end

    def call
      @response = post(path: payments_path(request_body))

      self
    end

    private

    def request_body
      {
        customer: @customer_id,
        billingType: "BOLETO",
        value: 100.0,
        dueDate: 3.days.from_now
      }
    end
  end
end
