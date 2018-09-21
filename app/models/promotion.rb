class Promotion < ApplicationRecord
    has_many :adjustments, as: :adjustable
    belongs_to :user
end
