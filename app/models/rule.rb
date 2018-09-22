class Rule < ApplicationRecord
    has_many :coupons
    has_many :promotions
    
    def discount(amount)
        (action == '%' ?
            (action_on.to_f/100*amount) :
            action_on).to_i
    end
end
