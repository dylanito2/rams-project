class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.text :content
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
