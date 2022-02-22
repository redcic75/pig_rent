class PigsController < ApplicationController
  def index
    @pigs = Pig.all
  end

  def show
    @pig = Pig.find(params[:id])
  end
end
