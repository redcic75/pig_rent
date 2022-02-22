class PigsController < ApplicationController
  def index
    @pigs = Pig.all
  end

  def show
  end
end
