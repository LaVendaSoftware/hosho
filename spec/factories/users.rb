FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email_address { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    role { "standard" }

    trait :standard do
      role { "standard" }
    end
    factory :standard_user, traits: [:standard]

    trait :seller do
      role { "seller" }
    end
    factory :seller_user, traits: [:seller]

    trait :manager do
      role { "manager" }
    end
    factory :manager_user, traits: [:manager]

    trait :admin do
      role { "admin" }
    end
    factory :admin_user, traits: [:admin]

    trait :developer do
      role { "developer" }
    end
    factory :developer_user, traits: [:developer]

    trait :blank do
      email_address { nil }
      password { nil }
    end
    factory :blank_user, traits: [:blank]
  end
end
