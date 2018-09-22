class Promotion < ApplicationRecord
    has_many :adjustments, as: :adjustable
    belongs_to :promotable, polymorphic: true
    belongs_to :rule

    def final_discount(price)
        rule.discount(price)
    end

    def self.valid_promotions
        where('date(expires_at) > now()')
    end
    
    #can add multiple logic to actually handle multiple promotions.
    def self.pick_winning_promotion
        valid_promotions.first
    end
end
