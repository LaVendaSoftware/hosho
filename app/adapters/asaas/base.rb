module Asaas
  class Base < AdapterClient
    def customers_path(params = {})
      "v3/customers?#{params.to_query}"
    end

    def payments_path(params = {})
      "v3/payments?#{params.to_query}"
    end

    def payments_pix_qr_code_path(id)
      "payments/#{id}/pixQrCode"
    end

    private

    def base_url
      ENV.fetch("ASAAS_BASE_URL", Rails.application.credentials.asaas[:base_url])
    end

    def api_key
      ENV.fetch("ASAAS_API_KEY", Rails.application.credentials.asaas[:api_key])
    end

    def headers
      {
        "Accept-Encoding": "*",
        "Content-Type": "application/json",
        accept: "application/json",
        access_token: api_key
      }
    end
  end
end
