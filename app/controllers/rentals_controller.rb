class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def new
  end

  def create
  end

  def edit
    @rental = Rental.find(params[:id])
  end

  def update
    if Rental.update(rental_params)
      redirect_to farmers_rentals_path
    else
      render :edit
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:status)
  end
end
