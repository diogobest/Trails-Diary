# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "email#{i}@teste.com" }
    password { Faker::Internet.password }

    trait :admin do
      admin {true}
    end
    
    trait :with_profile do
      profile
    end
  end
end
