class RentalsController < ApplicationController
  def index
  end

  def new
    @pig = Pig.find(params[:pig_id])
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.pig = Pig.find(params[:pig_id])
    @rental.status = 'pending'
    if @rental.save
      redirect_to rentals_path
    else
      render :new
      raise
    end
  end

  def edit
  end

  def update
  end

  private

  def rental_params
    params.require(:rental).permit(:user, :pig, :start_date, :end_date, :status)
  end
end
