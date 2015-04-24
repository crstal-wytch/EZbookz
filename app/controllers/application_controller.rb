class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_cart_details
  
  def set_cart_details
    @cart = current_cart
  end 
  
  def total_price
    cart_items.to_a.sum { |item| item.total_price }
  end 
  
  def total_item
    cart_items.to_a.sum { |item| item.quantity }
  end
  
  private
  
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
