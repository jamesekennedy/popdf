class LineItem < ActiveRecord::Base
  attr_accessible :description, :price, :quantity, :tax_rate, :line_item_id

  belongs_to :purchase_order
end
