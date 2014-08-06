class LineItem < ActiveRecord::Base
  attr_accessible :description, :price, :quantity, :tax_rate, :line_item_id

  belongs_to :purchase_order


  def total

  	quantity * ( 1 + (tax_rate) / 100) * price
  	
  end
end
