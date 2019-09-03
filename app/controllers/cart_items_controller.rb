class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]

  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end


   
  def create
    @cart.add_item(params)
     
    if @cart.save
      redirect_to carts_path
    else
      flash[:error] = 'There was a problem adding this item to your cart.'
      redirect_to @card
    end
  end
end
