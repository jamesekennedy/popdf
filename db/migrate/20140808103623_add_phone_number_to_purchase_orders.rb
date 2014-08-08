class AddPhoneNumberToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :phone_number, :string
    add_column :purchase_orders, :note, :text
  end
end
