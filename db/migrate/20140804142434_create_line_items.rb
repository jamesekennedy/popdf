class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :description
      t.integer :quantity
      t.integer :tax_rate
      t.decimal :price

      t.timestamps
    end
  end
end
