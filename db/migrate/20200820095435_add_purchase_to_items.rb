class AddPurchaseToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :purchase, :boolean
  end
end
