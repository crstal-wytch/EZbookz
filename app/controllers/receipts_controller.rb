class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @receipts = Receipt.paginate(:per_page => 5, :page => params[:page])
    respond_with(@receipts)
  end

  def show
    respond_with(@receipt)
  end

  def new
    @cart = current_cart
    if @cart.cart_items.empty?
      redirect_to items_path, notice: 'Your cart is empty'
      return
    end
    @receipt = Receipt.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @receipt }
    end
  end

  def edit
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @receipt.add_cart_items_from_cart(current_cart)
    
    respond_to do |format|
      if @receipt.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to items_path, notice: 'Thank you for your order.'}
        format.json {render json: @receipt, status: :created, location: @receipt}
      else
        @cart = current_cart
        format.html { render action: "new"}
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @receipt.update(receipt_params)
    respond_with(@receipt)
  end

  def destroy
    @receipt.destroy
    respond_with(@receipt)
  end

  private
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    def receipt_params
      params.require(:receipt).permit(:name, :address, :email, :pay_type)
    end
end
