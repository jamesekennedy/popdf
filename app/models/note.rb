class Note < ActiveRecord::Base
  belongs_to :purchase_order
  attr_accessible :content
end
