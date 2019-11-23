# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'Puncak Jaya' }
    text { "Puncak Jaya visited on day 20." }
    author { nil }
    profile_id { nil }
  end
end
