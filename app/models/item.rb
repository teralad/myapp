class Item < ApplicationRecord
    belongs_to :register
    has_many :adjustments, as: :adjustable
    belongs_to :product

    before_create :set_item_price ,:create_adjustments, :set_final_price

    attr_reader :final_value
    
    def create_adjustments
        discount = product.discount
        original_value = product.price
        @final_value = (original_value - discount) * quantity
        adjustments.build(source: 'Coupon',amount: discount, eligible: true, register_id: register.id)
        adjustments.build(source: 'Item',amount: item_price, eligible: true, register_id: register.id)
    end

    def update_count_on_hand
        product.update_attributes(count_on_hand: product.count_on_hand - quantity)
    end
    
    protected
    
    def set_item_price
        self.item_price = Product.find(product_id).price * quantity
    end

    def set_final_price
        self.final_price = final_value
    end
end
