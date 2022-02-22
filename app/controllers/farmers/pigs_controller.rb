class Farmers::PigsController < ApplicationController
  def index
  end

  def new
    @pig = Pig.new
  end

  def create
    @pig = Pig.new(pig_params)
    @pig.save
    redirect_to(pig_path(@pig.id))
  end

  def edit
    @pig = Pig.find(params[:id])
  end

  def update
    @pig = Pig.find(params[:id])
    @pig.update(pig_params)
    redirect_to(pig_path(@pig.id))
  end

  def destroy
  end

  private

  def pig_params
    params.require(:pig).permit(:name, :required_space, :eat_capacity, :daily_price)
  end

end
