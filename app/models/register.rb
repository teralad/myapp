class Register < ApplicationRecord
    has_many :items
    has_many :adjustments, -> { order(:created_at) }, as: :adjustable
    has_many :item_adjustments, through: :items, source: :adjustments
    belongs_to :user

    validates :payment_total, :numericality => { :greater_than_or_equal_to => 0 }

    before_validation :set_payment_total
    
    def add(product:, quantity:)
        ActiveRecord::Base.transaction do
            return 'no stock' if quantity > product.count_on_hand
            items.create(category_id: product.category_id, product: product, quantity: quantity)
            calculate_final_price
            update_count_on_hand
        end
    end

    def calculate_final_price
        if user.promotions.present? && !promotion_applied? && user.promotions_valid?
            discount = user.promotion.final_discount(item_total)
            adjustments.create(source: 'Promotion',amount: discount, eligible: true, register_id: id)
        end
        total_item_price = items.sum(:item_price)
        final_item_price = items.sum(:final_price)
        final_adjustment_price = adjustments.sum(:amount)
        payment_total = total_item_price + final_adjustment_price
        self.update_attributes(total: final_item_price, item_total: total_item_price, adjustment_total: final_adjustment_price, payment_total: payment_total)
    end

    def checkout
        if state != 'Paid'
            update_attributes(state: 'Paid')
        else
            puts "State is already paid cannot pay again"
        end
    end

    private
    def update_count_on_hand
        items.each do |item|
            item.update_count_on_hand
        end
    end

    def promotion_applied?
        adjustments.where(source: 'Promotion').present?
    end

    def set_payment_total
        self.payment_total = self.payment_total <= 0 ? 0 : self.payment_total
    end

end
