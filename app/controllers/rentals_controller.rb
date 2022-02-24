class RentalsController < ApplicationController
  def index
    @rentals = Rental.where(user: current_user)
  end

  def new
    @pig = Pig.find(params[:pig_id])
    @rental = Rental.new
  end

  def create
    @pig = Pig.find(params[:pig_id])
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.pig = @pig
    @rental.status = 'pending'
    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
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
    params.require(:rental).permit(:user, :pig, :start_date, :end_date, :status)
  end
end
