class Promotion < ApplicationRecord
    has_many :adjustments, as: :adjustable
    belongs_to :promotable, polymorphic: true
    belongs_to :rule

    def self.valid_promotions
        where('date(expires_at) > now()')
    end
    
    #can add multiple logic to actually handle multiple promotions.
    def self.pick_winning_promotion(user)
        return user.promotions.first if user.promotions.present? && user.promotions.first.valid_promotion?
        valid_promotions.first
    end
    
    def valid_promotion?
        expires_at > Time.now
    end

    def final_discount(price)
        rule.discount(price)
    end

end
