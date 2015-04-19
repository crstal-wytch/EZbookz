class Item < ActiveRecord::Base
  
  has_many :cart_items
  
  before_destroy :ensure_not_referenced_by_any_cart_item
  
  def ensure_not_referenced_by_any_cart_item
    if cart_items.count.zero?
      return true
    else
      errors[:base] << "Items are present in cart"
      return false
    end
  end
  
  # search bar for item database
  def self.search(query)
    where("title OR author LIKE ?", "%#{query}%")
  end
  
  
end
