class Pig < ApplicationRecord
  has_many :rentals
  has_many :users, through: :rentals

  validates :name, presence: true, uniqueness: true
  validates :daily_price, presence: true
end
