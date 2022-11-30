class CreateItemTags < ActiveRecord::Migration[6.1]
  def change
    create_table :item_tags do |t|
      t.integer :post_item_id, null: false
      t.integer :tag_id, null: false
      t.timestamps
    end
  end
end
