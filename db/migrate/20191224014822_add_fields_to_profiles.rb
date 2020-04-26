# frozen_string_literal: true

class AddFieldsToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :username, :string
    add_column :profiles, :city, :string
    add_column :profiles, :state, :string
  end
end
