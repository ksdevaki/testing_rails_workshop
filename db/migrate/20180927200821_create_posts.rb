class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :group_id
      t.integer :user_id
      t.date :date
      t.text :body

      t.timestamps null: false
    end
  end
end
