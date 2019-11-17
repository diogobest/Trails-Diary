class Profile < ApplicationRecord
  has_many :posts
  has_one :user
end
