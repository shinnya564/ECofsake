# frozen_string_literal: true

FactoryBot.define do
  factory :bulletin_board do
    title { Faker::Internet.username(specifier: 30) }
    name { Faker::Internet.username(specifier: 5) }
    body { Faker::Number.number(digits: 7) }
  end
end
