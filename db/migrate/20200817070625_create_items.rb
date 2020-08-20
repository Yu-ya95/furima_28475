class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :item_text, null: false
      t.integer :category_code, null: false
      t.integer :status_code, null: false
      t.integer :postage_code, null: false
      t.integer :prefecture_code, null: false
      t.integer :delivery_days_code, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
