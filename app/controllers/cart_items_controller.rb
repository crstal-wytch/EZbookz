class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cart_items = CartItem.all
    respond_with(@cart_items)
  end

  def show
    respond_with(@cart_item)
  end

  def new
    @cart_item = CartItem.new
    respond_with(@cart_item)
  end

  def edit
  end

  def create
    @cart = current_cart
    item = Item.find(params[:item_id])
    @cart_item = @cart.add_item(item.id)
    
    respond_to do |format|
      if @cart_item.save
        format.html {redirect_to(@cart_item.cart, :notice => 'Item was added to cart successfully.')}
        format.xml {render :xml => @cart_item, :status => :created, :location => @cart_item }
      else
        format.html { render :action => 'new'}
        format.xml { render :xml => @cart_item.errors, :status => :unprocessable_entity }
      end
    end
  
  
  end

  def update
    @cart_item.update(cart_item_params)
    respond_with(@cart_item)
  end

  def destroy
    @cart_item.destroy
    respond_with(@cart_item)
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def cart_item_params
      params.require(:cart_item).permit(:item_id, :cart_id)
    end
end
