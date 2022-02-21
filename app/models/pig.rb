class Pig < ApplicationRecord
  has_many :rentals, dependent: :nullify
  has_many :users, through: :rentals
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :daily_price, presence: true
end
