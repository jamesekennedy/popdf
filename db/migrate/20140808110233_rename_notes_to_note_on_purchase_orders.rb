class RenameNotesToNoteOnPurchaseOrders < ActiveRecord::Migration
  def up
  	rename_column :purchase_orders, :notes, :note
  end

  def down
  end
end
