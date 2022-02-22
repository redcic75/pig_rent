class Pig < ApplicationRecord
  has_many :rentals, dependent: :nullify
  has_many :users, through: :rentals
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3 }
  validates :daily_price, presence: true, numericality: { only_integer: true }
end
