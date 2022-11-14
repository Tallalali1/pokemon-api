# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon do
    name { Faker::Games::Pokemon.name }
    base_experience { Faker::Number.number(digits: 3) }
    weight { Faker::Number.number(digits: 3) }
  end
end
