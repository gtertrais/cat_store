class ChargesController < ApplicationController
    def new
     
    end
    
    def create
      # Amount in cents
      @amount = 0
        @cart_items = current_user.cart.cart_items
        current_user.cart.items.each do |i|
          @amount = @amount + i.price
        end
      @amount = @amount.to_i * 100
        puts '='*100
      puts @amount
    puts '='*100
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to carts_path
    end
end
