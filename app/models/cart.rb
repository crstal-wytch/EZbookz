class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  
  def add_item(item_id)
    current_item = cart_items.where(:item_id => item_id).first
    if current_item
      current_item.quantity += 1
    else
      current_item = CartItem.new(:item_id => item_id)
      cart_items << current_item
    end
    current_item
  end
  
  def total_price
    cart_items.to_a.sum { |item| item.total_price }
  end 
end
