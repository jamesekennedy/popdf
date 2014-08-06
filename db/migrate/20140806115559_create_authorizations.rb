class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :email
      t.string :authorization_key
      t.boolean :authorized
      t.integer :purchase_order_id

      t.timestamps
    end
  end
end
