class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.integer :number
      t.string :budget
      t.string :raised_by
      t.string :your_company_name
      t.text :delivery_address
      t.string :supplier_name

      t.timestamps
    end
  end
end
