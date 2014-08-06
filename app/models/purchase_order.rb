class PurchaseOrder < ActiveRecord::Base

  has_many :line_items

  attr_accessible :budget, :delivery_address, :number, :raised_by, :supplier_name, :your_company_name, :line_items_attributes


  accepts_nested_attributes_for :line_items


  def total

  	line_items.sum("price * quantity")
  	
  end


  def total_including_tax

  	line_items.each.sum do |li|

  		li.quantity * li.price.to_f * (1 + ( li.tax_rate.to_f / 100 ))


  	end
  	
  end


  def to_label

  	"#{your_company_name} #{raised_by} Purchase Order #{number}".parameterize
  	
  end

end
