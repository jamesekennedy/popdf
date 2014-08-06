class AddConversationKeyToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :conversation_key, :string
  end
end
