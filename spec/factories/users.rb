FactoryBot.define do
  factory :user do
    nickname { Faker::Lorem.word }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name { 'お試し' }
    first_name { 'お試し' }
    last_name_kana { 'テスト' }
    first_name_kana { 'テスト' }
    birthday { Faker::Date.between(from: '1930-1-1', to: '2016-12-31') }
  end
end
