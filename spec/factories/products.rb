FactoryBot.define do
  factory :product do
    category

    title { Faker::Name.name }

    trait :blank do
      category factory: :blank_category

      title { nil }
    end
    factory :blank_product, traits: [:blank]
  end
end
