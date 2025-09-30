FactoryBot.define do
  factory :order_item do
    order
    product_variant

    quantity { 1 }
    unit_price { Faker::Number.decimal(l_digits: 3, r_digits: 2) }

    trait :blank do
      order factory: :blank_order
      product_variant factory: :blank_product_variant

      quantity { nil }
      unit_price { nil }
    end
    factory :blank_order_item, traits: [:blank]
  end
end
