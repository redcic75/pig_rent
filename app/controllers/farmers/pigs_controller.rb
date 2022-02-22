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
  end

  def update
  end

  def destroy
  end
end
