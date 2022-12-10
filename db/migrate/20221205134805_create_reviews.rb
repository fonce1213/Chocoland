class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post_item, null: false, foreign_key: true
      t.text :review, null: false
      t.float :evaluation, null: false
      t.boolean :is_draft, null: false, default: false
      t.timestamps
    end
  end
end
