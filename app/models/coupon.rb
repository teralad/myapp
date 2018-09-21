class Coupon < ApplicationRecord
    has_many :adjustments, as: :adjustable
    belongs_to :product
end
