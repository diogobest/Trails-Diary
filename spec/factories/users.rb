# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "email#{i}@teste.com" }
    password { '123456' }
  end
end
