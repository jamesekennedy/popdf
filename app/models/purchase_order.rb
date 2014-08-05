class PurchaseOrder < ActiveRecord::Base

  has_many :line_items

  attr_accessible :budget, :delivery_address, :number, :raised_by, :supplier_name, :your_company_name, :line_items_attributes


  accepts_nested_attributes_for :line_items


end
