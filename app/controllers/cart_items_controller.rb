class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]

  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end


   
  def create
    #@cart.add_item(params)
    
    @cart = Cart.find(session[:cart_id])
    @cart_item = CartItem.create(cart_id: @cart.id, item_id: params[:format])
    
    if @cart_item.save    
      redirect_to carts_path
    else
    
      flash[:error] = 'There was a problem adding this item to your cart.'
      redirect_to root_path 
    end
  end

  def destroy
    item = params[:id]
   CartItem.destroy(item)
    redirect_to carts_path
  end

end
