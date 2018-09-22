# prints out the inventory and performs a few transactions and then at the end of these transactions, 
# prints out the remaining items in the store
# prints out the total sales during the day.
module CheckoutHelper
    def print_inventory
        products = Product.where('count_on_hand > 0 and deleted_at is null and (available_on is null or now() > date(available_on))')
        puts "\n\nThe following is our inventory at this point of time \n"
        products.map { |product| puts "Product name is #{product.name} and stock is #{product.count_on_hand} and price is #{product.price}" }
    end

    def perform_transaction(user: User.first)
        4.times do
            user = User.offset(rand(User.count)).first
            register = user.create_register
            3.times do
                product = Product.offset(rand(Product.count)).first
                quantity = rand(1..product.count_on_hand)
                next if quantity.nil?
                register.add(product: product, quantity: quantity)
            end
            register.checkout
        end
        puts "After performing few transactions the inventory is"
        puts "--------------------------------------------------"
        print_inventory
    end

    def total_sales(day: Date.today)
        registers = Register.where("date(created_at) = '#{day}'").group(:user_id).
                    select("user_id, sum(payment_total) total_earnings, sum(adjustment_total) total_offers")
        registers.each do |reg|
            puts "Total earning from user #{reg[:user_id]} is #{reg[:total_earnings]} and offer given is #{reg[:total_offers]}"
        end
    end
end