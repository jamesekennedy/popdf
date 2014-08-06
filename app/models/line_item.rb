class LineItem < ActiveRecord::Base
  attr_accessible :description, :price, :quantity, :tax_rate, :line_item_id

  belongs_to :purchase_order



  validates :price, presence: true
  validates :description, presence: true
  def total

  	rate = tax_rate.blank? ? 0 : tax_rate / 100 
  	quantity * ( 1 + rate ) * price
  	
  end
end


	
