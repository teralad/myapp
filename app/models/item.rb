class Item < ApplicationRecord
    belongs_to :register
    has_many :adjustments, as: :adjustable
end
