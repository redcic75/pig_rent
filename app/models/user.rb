class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rentals, dependent: :nullify
  has_many :pigs, through: :rentals
  has_many :pigs, dependent: :destroy

  has_one_attached :photo

  validates :address, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
