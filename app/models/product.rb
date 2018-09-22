class Product < ApplicationRecord
    has_one :coupon
    belongs_to :category

    validates :count_on_hand, :numericality => { :greater_than_or_equal_to => 0 }
    def discount
        (coupon.present? && coupon.eligible?) ? coupon.final_price : 0
    end
end
