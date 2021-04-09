FactoryBot.define do
  factory :order_delivery do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '千代田区' }
    building { '柳ビル' }
    telephone_number {Faker::Number.leading_zero_number(digits: 11)}
  end
end