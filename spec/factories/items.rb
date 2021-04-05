FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    detail { Faker::Lorem.sentence }
    category_id {1}
    quality_id {1}
    delivery_fee_id {1}
    prefecture_id {1}
    delivery_day_id {1}
    price { Faker::Number.number(digits: 5) }
    association :user, factory: :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
