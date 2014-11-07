class AddDateToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :date, :text
  end
end
