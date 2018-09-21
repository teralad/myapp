class Product < ApplicationRecord
    has_many :coupons
    belongs_to :category
end
