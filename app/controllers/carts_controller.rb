class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @items = current_user.cart.items
  end

  # GET /carts/1
  # GET /carts/1.json
  
end
