FactoryBot.define do
  factory :category do
    company

    title { Faker::Name.name }

    trait :blank do
      company factory: :blank_company

      title { nil }
    end
    factory :blank_category, traits: [:blank]
  end
end
