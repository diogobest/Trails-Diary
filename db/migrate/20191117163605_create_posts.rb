class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.string :author
      t.string :location

      t.timestamps
    end
  end
end
