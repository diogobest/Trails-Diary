# frozen_string_literal: true

class Profile < ApplicationRecord
  has_many :posts
  belongs_to :user

  validates :name, :age, presence: true
end
