class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :user_classification, optional: true
  has_many :promotions, through: :user_classification
  before_create :set_user_classification
  has_many :registers

  def promotions_valid?
    promotion.present?
  end

  def promotion
    Promotion.pick_winning_promotion
  end

  def create_register
    registers.create(state: 'created')
  end

  def set_user_classification
    self.user_classification_id = UserClassification.figure(self).id
  end
end
