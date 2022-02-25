class PagesController < ApplicationController

  def home
    @pigs = Pig.all
  end
end
