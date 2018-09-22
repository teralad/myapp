class Coupon < ApplicationRecord
    belongs_to :product
    belongs_to :rule

    def final_price
        rule.discount(product.price)
    end

    def eligible?
        expires_at > Time.now
    end
end
