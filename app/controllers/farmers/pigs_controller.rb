class Farmers::PigsController < ApplicationController
  def index
  end

  def new
    @pig = Pig.new
  end

  def create
    @pig = Pig.new(pig_params)
    @pig.user_id = current_user.id
    if @pig.save
      redirect_to(farmers_pig_path(@pig.id))
    else
      render :new
    end
  end

  def edit
    @pig = Pig.find(params[:id])
  end

  def update
    @pig = Pig.find(params[:id])
    if @pig.update(pig_params)
      redirect_to(farmers_pig_path(@pig.id))
    else
      render :new
    end
  end

  def destroy
    @pig = Pig.find(params[:id])
    @pig.destroy
    redirect_to farmers_pigs_path
  end

  private

  def pig_params
    params.require(:pig).permit(:name, :required_space, :eat_capacity, :daily_price)
  end

end
