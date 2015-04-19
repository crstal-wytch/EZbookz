class Item < ActiveRecord::Base
  
  def self.search(query)
    where("title OR author LIKE ?", "%#{query}%")
  end
end
