module Addresses
  class GetByZipCode < UseCaseBase
    required_attributes(:zip_code)

    def call
      return fail! if client.failure?

      context.address = Address.new(client.body)
    end

    private

    def client
      @client ||= ViaCEP::Client.call(context.zip_code)
    end
  end
end
