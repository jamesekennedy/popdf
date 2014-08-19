class ChangeDescroptionToTextOnLineItems < ActiveRecord::Migration
  def up
  	change_column :line_items, :description, :text
  end

  def down
  	change_column :line_items, :description, :string
  end
end
