class PigsController < ApplicationController
  def index
  end

  def show
    @pig = Pig.find(params[:id])
  end
end
