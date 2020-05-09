# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :profile
  validates :title, presence: true
  validates :state, presence: true, length: { maximum: 2 }
end
