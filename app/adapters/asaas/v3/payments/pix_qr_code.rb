module Asaas::V3::Payments
  class PixQrCode < Asaas::Base
    # Initializes Asaas::V3::Payments::PixQrCode
    #
    # Example:
    #   pix = Asaas::V3::Customers::PixQrCode.call("cus_000007065100")
    def initialize(gateway_payment_id)
      @gateway_payment_id = gateway_payment_id
    end

    def call
      @response = get(path: payments_pix_qr_code_path(@gateway_payment_id))

      self
    end
  end
end
