module Asaas::V3::Customers
  class Create < Asaas::Base
    # Initializes Asaas::V3::Customers::Post
    #
    # Example:
    #   customer = Asaas::V3::Customers::Post.call(
    #     name: "José da Silva",
    #     email: "jose@email.com",
    #     document: "12345678901",
    #     phone: "4799999999"
    #   )
    def initialize(name:, email:, document:, phone:)
      @name = name
      @email = email
      @document = document
      @phone = phone
    end

    def call
      @response = post(path: customers_path(request_body))

      self
    end

    private

    def request_body
      {
        name: @name,
        email: @email,
        cpfCnpj: @document,
        mobilePhone: @phone,
        phone: nil, # "4738010919",
        address: nil, # "Av. Paulista",
        addressNumber: nil, # "150",
        complement: nil, # "Sala 201",
        province: nil, # "Centro",
        postalCode: nil, # "01310-000",
        externalReference: nil, # "12987382",
        notificationDisabled: true,
        municipalInscription: nil, # "46683695908",
        stateInscription: nil, # "646681195275",
        observations: nil, # "great payer, no problems so far",
        foreignCustomer: false
      }.compact
    end
  end
end
