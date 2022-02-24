class Farmers::RentalsController < ApplicationController
  def index
    @rentals = Rental.includes(:pig).where(pig: {user: current_user})
  end
end
