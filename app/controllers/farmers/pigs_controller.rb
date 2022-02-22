class Farmers::PigsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @pig = Pig.find(params[:id])
    @pig.destroy
    redirect_to farmers_pigs_path
  end
end
