module ViaCEP
  class Client < AdapterClient
    BASE_URL = "https://viacep.com.br/ws"
    SERIALIZER = ViaCEP::Serializer

    def initialize(zip_code)
      @zip_code = zip_code.to_s.delete("^0-9")
    end

    def call
      @response = get(path: "#{@zip_code}/json")

      self
    end

    def success?
      super && !ToBoolean.call(serialized_body[:erro])
    end
  end
end
