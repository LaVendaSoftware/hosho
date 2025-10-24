module ViaCEP
  class Serializer < AdapterSerializer
    def call
      {
        country: "BR",
        source: "via_cep",
        raw_address: body,
        zip_code: body[:cep],
        street_name: body[:logradouro],
        district: body[:bairro],
        city: body[:localidade],
        state: body[:uf]
      }
    end
  end
end
