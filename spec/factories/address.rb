# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    postal_code { Faker::Number.number(digits: 7) }
    address { Faker::Address.full_address }
    name { Faker::Lorem.characters(number: 5) }
    end_user
  end
end
