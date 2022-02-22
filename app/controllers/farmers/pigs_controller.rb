class Farmers::PigsController < ApplicationController
  before_action :set_pig, only: %i[edit update destroy]
  def index
    @pigs = Pig.where(user: current_user)
  end

  def new
    @pig = Pig.new
  end

  def create
    @pig = Pig.new(pig_params)
    @pig.user_id = current_user.id
    if @pig.save
      redirect_to(pig_path(@pig))
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pig.update(pig_params)
      redirect_to(pig_path(@pig))
    else
      render :new
    end
  end

  def destroy
    @pig.destroy
    redirect_to farmers_pigs_path
  end

  private

  def pig_params
    params.require(:pig).permit(:name, :required_space, :eat_capacity, :daily_price)
  end

  def set_pig
    @pig = Pig.find(params[:id])
  end




end
