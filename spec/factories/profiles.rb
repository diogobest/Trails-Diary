# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    user_id { nil }
    name { Faker::FunnyName.name }
    sequence(:age) { |a| a }
  end
end
