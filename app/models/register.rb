class Register < ApplicationRecord
    has_many :items
    has_many :adjustments, -> { order(:created_at) }, as: :adjustable
    has_many :item_adjustments, through: :items, source: :adjustments
end
Order = Register