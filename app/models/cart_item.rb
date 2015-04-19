class CartItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart
  belongs_to :receipt
  
  def total_price
    item.price * quantity
  end
  
end
