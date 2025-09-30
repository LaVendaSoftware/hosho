FactoryBot.define do
  factory :customer do
    user

    document_type { "cpf" }
    document { Faker::IdNumber.brazilian_citizen_number }
    country_code { "55" }
    phone { Faker::PhoneNumber.cell_phone.to_s.gsub(/[^0-9]/, "").strip }

    trait :blank do
      user factory: :blank_user

      document_type { nil }
    end
    factory :blank_customer, traits: [:blank]
  end
end
