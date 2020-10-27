# frozen_string_literal: true

FactoryBot.define do
  factory :end_user do
    family_name { Faker::Internet.username(specifier: 5) }
    first_name { Faker::Internet.username(specifier: 5) }
    kana_family_name { |_n| 'カタカナミョウジ' }
    kana_first_name { |_n| 'カタカナナマエ' }
    postal_code { Faker::Number.number(digits: 7) }
    address { Faker::Address.full_address }
    tel { Faker::Number.number(digits: 11) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
