FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    nif { Faker::Base.numerify("########-#") }
    industry { "other" }
    disabled_at { nil }

    trait :tourism do
      role { "tourism" }
    end
    factory :tourism_company, traits: [:tourism]

    trait :commerce do
      role { "commerce" }
    end
    factory :commerce_company, traits: [:commerce]

    trait :food do
      role { "food" }
    end
    factory :food_company, traits: [:food]

    trait :automotive do
      role { "automotive" }
    end
    factory :automotive_company, traits: [:automotive]

    trait :blank do
      name { nil }
      nif { nil }
      industry { nil }
      disabled_at { nil }
    end
    factory :blank_company, traits: [:blank]
  end
end
