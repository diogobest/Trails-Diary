# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :profile
  validates :title, presence: true
  validates :state, presence: true, length: { is: 2, message: "%{count} characters is allowed" }
end
