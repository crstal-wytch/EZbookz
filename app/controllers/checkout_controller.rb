class CheckoutController < ApplicationController
  protect_from_forgery with: :exception
  
  before_action :set_checkout_details
  
  
 def set_checkout_details
    cart = session[:cart]
    id = params[:id]
    quantity = params[:quantity].to_i
    @cart = session[:cart]
    @total_price = 0
    if(cart)
      @total_items = session[:cart].size

     cart.each do | id, quantity |
      item = Item.find_by_id(id) 
      @total_price += quantity * item.price 
    end
    else
      @total_items = 0
    end
  end
  
end
