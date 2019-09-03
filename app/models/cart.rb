class Cart < ApplicationRecord
    belongs_to :user, optional: true
    has_many :cart_items
    has_many :items, through: :cart_items

    def add_item(item_params)
        current_item = CartItem.find_by(item_id: items_params[:item][:item_id])
        if current_item
            flash[:alert] = "Item already in your basket"
        else
            new_item = CartItem.create(item_id: items_params[:item][:item_id], cart_id: self.id)
        end
    end
end
