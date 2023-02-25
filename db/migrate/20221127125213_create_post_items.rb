class CreatePostItems < ActiveRecord::Migration[6.1]
  def change
    create_table :post_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :item_name, null: false
      t.integer :price, null: false
      t.string :item_URL, null: false
      t.timestamps
    end
  end
end
