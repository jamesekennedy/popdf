class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.references :purchase_order

      t.timestamps
    end
    add_index :notes, :purchase_order_id
  end
end
