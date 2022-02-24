class PigsController < ApplicationController
  def index
    @pigs = Pig.all

    @markers = @pigs.map do |pig|
      {
        lat: pig.user.latitude,
        lng: pig.user.longitude,
        # info_window: render_to_string(partial: "info_window", locals: { flat: flat }),
        image_url: pig.active? ? helpers.asset_url("activepig.png") : helpers.asset_url("inactivepig.png")
      }
    end
  end

  def show
    @pig = Pig.find(params[:id])
  end
end
