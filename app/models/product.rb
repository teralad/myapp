class Product < ApplicationRecord
    has_one :coupon
    belongs_to :category

    def discount
        (coupon.present? && coupon.eligible?) ? coupon.final_price : 0
    end
end
