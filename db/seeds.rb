# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
UserClassification.create(name: 'SENIOR_MALE',age: 60)
UserClassification.create(name: 'SENIOR_FEMALE',age: 60)
UserClassification.create(name: 'JUNIOR_MALE',age: 20)
UserClassification.create(name: 'JUNIR_FEMALE',age: 20)
UserClassification.create(name: 'ADULT',age: 21)

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# initializes the items in the store, 
category = Category.create([{name: 'Chips'}, {name: 'Packaged Drinks'}, {name: 'Dairy'}])
chips_category = Category.find_by_name('Chips')
drink_category = Category.find_by_name('Packaged Drinks')
dairy_category = Category.find_by_name('Dairy')
Product.create(name: 'Lays', category_id: chips_category.id, description: 'American cream and onion',count_on_hand: 70, price: 10)
Product.create(name: 'Bingo', category_id: chips_category.id, description: 'tomato tang',count_on_hand: 50, price: 10)
Product.create(name: 'Pepsi', category_id: drink_category.id, description: 'Pepsi trademark drink',count_on_hand: 100, price: 30)
Product.create(name: 'Coke', category_id: drink_category.id, description: 'Coca cola trademark drink',count_on_hand: 90, price: 30)
Product.create(name: 'Paneer', category_id: dairy_category.id, description: 'Milk product',count_on_hand: 30, price: 80)
Product.create(name: 'cavins', category_id: dairy_category.id, description: 'Think milk shake',count_on_hand: 10, price: 35)

Rule.create(name: 'FLAT_PERCENT', description: 'percent discount on price', action: '%', action_on: -25)
Rule.create(name: 'FLAT_DISCOUNT', description: 'percent discount on price', action: '+', action_on: -100)

lays = Product.find_by_name('Lays')
rule = Rule.find_by_name('FLAT_PERCENT')
Coupon.create(product: lays,name: 'lays discount',rule: rule,expires_at: Time.now+100.day)

promotion_rule = Rule.find_by_name('FLAT_DISCOUNT')
male_user_class = UserClassification.find_by_name('SENIOR_MALE')
female_user_class = UserClassification.find_by_name('SENIOR_FEMALE')
Promotion.create(promotable_type: 'Category', promotable_id: chips_category.id, name: 'discount on chips', rule: promotion_rule,expires_at: Time.now+100.day)
Promotion.create(promotable_type: 'UserClassification', promotable_id: male_user_class.id, name: 'discount for senior citizen', rule: promotion_rule,expires_at: Time.now+100.day)
Promotion.create(promotable_type: 'UserClassification', promotable_id: female_user_class.id, name: 'discount for senior citizen', rule: promotion_rule,expires_at: Time.now+100.day)
