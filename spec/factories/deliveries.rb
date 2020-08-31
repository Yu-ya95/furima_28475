FactoryBot.define do
  factory :delivery do
    postcode { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '市区町村' }
    block { '番地' }
    building { '建物名' }
    phone_number { '09012345678' }
    association :purchase
  end
end
