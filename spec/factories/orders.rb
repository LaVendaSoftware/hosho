FactoryBot.define do
  factory :order do
    company
    customer
    user

    due_date { 3.days.from_now }

    # after(:build) do |order, evaluator|
    #   order.items.each do |meeting|
    #     order.items <<
    #   end

    #   order.payment = build("#{order.payment_method}_payment", order:)
    # end

    trait :blank do
      company factory: :blank_company
      customer factory: :blank_customer
      user factory: :blank_user

      items { [] }
      due_date { nil }
    end
    factory :blank_order, traits: [:blank]
  end
end
