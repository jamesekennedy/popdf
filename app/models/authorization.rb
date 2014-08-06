class Authorization < ActiveRecord::Base
  attr_accessible :authorization_key, :authorized, :email, :purchaseo_order_id

  before_create :generate_authorization_key

  belongs_to :purchase_order


  validates :authorization_key, uniqueness: true
  validates :email, presence: true
  


  private

  def generate_authorization_key

  	self.authorization_key = SecureRandom.hex(5)
  end
end
