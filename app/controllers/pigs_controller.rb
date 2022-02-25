class PigsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @pigs = Pig.all

    @markers = @pigs.map do |pig|
      {
        lat: pig.user.latitude,
        lng: pig.user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pig: pig }),
        image_url: pig.active? ? helpers.asset_url("activepig.png") : helpers.asset_url("inactivepig.png")
      }
    end
  end

  def show
    @pig = Pig.find(params[:id])
  end
end
