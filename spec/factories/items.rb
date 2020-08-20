FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    item_text { Faker::Lorem.sentence }
    category_code { Faker::Number.between(from: 2, to: 11) }
    status_code { Faker::Number.between(from: 2, to: 7) }
    postage_code { Faker::Number.between(from: 2, to: 3) }
    prefecture_code { Faker::Number.between(from: 2, to: 48) }
    delivery_days_code { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9999999) }
    association :user
  end
end
