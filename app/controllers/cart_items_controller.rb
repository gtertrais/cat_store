class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy], :if => :signed_in?
  
  
  def create
    @cart = Cart.find(session[:cart_id])
    @item = CartItem.create(cart_id: @cart.id, item_id: params[:format])

    if @item.save    
      redirect_to carts_path
    else
    
      flash[:error] = 'There was a problem adding this item to your cart.'
      redirect_to edit_user_registration_path 
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @item.delete(params)
    redirect_to carts_path
  end

end
