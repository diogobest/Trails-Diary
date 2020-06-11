# frozen_string_literal: true

class ChangeColumnNameFromPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :location, :state
  end
end
