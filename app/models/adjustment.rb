class Adjustment < ApplicationRecord
    belongs_to :register
    belongs_to :adjustable, polymorphic: true
    
end
