class AddPurchaseOrderToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :purchase_order_id, :integer
  end
end
