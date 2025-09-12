FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    role { User.roles.keys.sample }

    trait :blank do
      email { nil }
      password { nil }
    end

    trait :developer do
      role { "developer" }
    end

    factory :blank_user, traits: [:blank]
    factory :developer_user, traits: [:developer]
  end
end
