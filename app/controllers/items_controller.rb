class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cart = current_cart
    if params[:search] 
      @items = Item.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
      respond_with(@items)
    else
      @items = Item.paginate(:per_page => 5, :page => params[:page])
    end
  end

  def show
    respond_with(@item)
  end
  
  def new
    @item = Item.new
    respond_with(@item)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    respond_with(@item)
  end

  def update
    @item.update(item_params)
    respond_with(@item)
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end
  
  def import
    Item.import(params[:file])
    redirect_to items_path, notice: "Upload successful"
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:author, :title, :description, :price, :image_url)
    end
end
