class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy], :if => :signed_in?
  
  
  def create
    @cart.add_item(params)
     
    if @cart.save
      redirect_to cart_path
    else
      flash[:error] = 'There was a problem adding this item to your cart.'
      redirect_to root_path
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
    redirect_to cart_path
  end

end
