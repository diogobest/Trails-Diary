# frozen_string_literal: true

class AddRefToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :profile, null: false, foreign_key: true
  end
end
