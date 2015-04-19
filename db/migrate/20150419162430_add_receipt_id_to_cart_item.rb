class AddReceiptIdToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :receipt_id, :integer
  end
end
