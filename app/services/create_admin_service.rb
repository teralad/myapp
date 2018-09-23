class CreateAdminService
  def call
    User.find_or_create_by!(email: Rails.application.secrets.admin_email, name: 'admin') do |user|
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
    end
    Customer.find_or_create_by!(email: 'customer1@gmail.com', name: 'customer1', age: 22) do |user|
       user.password = 'password'
    end
    Customer.find_or_create_by!(email: 'customer2@gmail.com', name: 'customer2', age: 66) do |user|
       user.password = 'password'
    end
    Customer.find_or_create_by!(email: 'customer3@gmail.com', name: 'customer3', age: 80) do |user|
       user.password = 'password'
    end
    Customer.find_or_create_by!(email: 'customer4@gmail.com', name: 'customer4', age: 45) do |user|
       user.password = 'password'
    end
    Customer.find_or_create_by!(email: 'customer5@gmail.com', name: 'customer5', age: 60) do |user|
       user.password = 'password'
    end
    Employee.find_or_create_by!(email: 'employee1@gmail.com', name: 'employee1', age: 22) do |user|
      user.password = 'password'
    end
    Employee.find_or_create_by!(email: 'employee2@gmail.com', name: 'employee2', age: 23) do |user|
      user.password = 'password'
    end
    Employee.find_or_create_by!(email: 'employee4@gmail.com', name: 'employee4', age: 66) do |user|
      user.password = 'password'
    end
    Employee.find_or_create_by!(email: 'employee5@gmail.com', name: 'employee5', age: 45) do |user|
      user.password = 'password'
    end
  end
end
