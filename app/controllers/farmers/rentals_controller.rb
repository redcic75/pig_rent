class Farmers::RentalsController < ApplicationController
  def index
    @rentals = Rental.where(user: current_user)
  end
end
