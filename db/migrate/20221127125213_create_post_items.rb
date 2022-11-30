class CreatePostItems < ActiveRecord::Migration[6.1]
  def change
    create_table :post_items do |t|
      t.integer :user_id, null: false
      t.integer :shop_id, null: false
      t.string :item_name, null: false
      t.text :review, null: false
      t.integer :price, null: false
      t.float :evaluation, null: false
      t.string :item_URL, null:false
      t.boolean :is_draft, null: false, default: true
      t.timestamps
    end
  end
end
