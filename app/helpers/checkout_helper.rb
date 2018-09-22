# prints out the inventory and performs a few transactions and then at the end of these transactions, 
# prints out the remaining items in the store
# prints out the total sales during the day.
module CheckoutHelper
    def print_inventory
        products = Product.where('count_on_hand > 0 and deleted_at is null and (available_on is null or now() > date(available_on))')
        puts "\n\nThe following is our inventory at this point of time \n"
        products.map { |product| puts "Product name is #{product.name} and stock is #{product.count_on_hand}\n" }
    end

    def perform_transaction(user: User.first)
        4.times do
            user = User.offset(rand(User.count)).first
            register = user.create_register
            product = Product.offset(rand(Product.count)).first
            quantity = rand(1..product.count_on_hand)
            register.add(product: product, quantity: quantity)
            register.checkout
        end
        puts "After performing few transactions the inventory is"
        puts "--------------------------------------------------"
        print_inventory
    end

    def total_sales(day: Date.today)
        Register.where("date(created_at) = '#{day}'")
    end
end