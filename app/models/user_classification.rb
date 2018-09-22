class UserClassification < ApplicationRecord
    has_many :users
    has_many :promotions, as: :promotable
    
    def self.figure(user)
        if user.age.nil?
            UserClassification.find_by_name('ADULT')
        elsif user.age <= 20
            UserClassification.find_by_name('JUNIOR_MALE')
        elsif user.age >= 60
            UserClassification.find_by_name('SENIOR_MALE')
        else
            UserClassification.find_by_name('ADULT')
        end
    end
end
