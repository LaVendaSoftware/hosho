FactoryBot.define do
  factory :product_variant do
    product

    title { Faker::Name.name }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    description { Faker::Lorem.paragraph }

    trait :blank do
      product factory: :blank_product

      title { nil }
      price { nil }
      description { nil }
    end
    factory :blank_product_variant, traits: [:blank]
  end
end
