class AddEmailToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :email, :string
  end
end
