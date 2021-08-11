class RenameItemColumToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_details, :item, :item_id
  end
end
