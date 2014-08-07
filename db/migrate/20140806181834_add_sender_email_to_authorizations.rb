class AddSenderEmailToAuthorizations < ActiveRecord::Migration
  def change
    add_column :authorizations, :sender_email, :string
  end
end
