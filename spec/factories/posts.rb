# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Game.title }
    text { Faker::Movies::Hobbit.location }
    state { 'SP' }
    author { nil }
    profile_id { nil }
  end
end
