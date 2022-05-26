class PlacesController < ApplicationController

  def index
    @places = Place.where({ "user_id" => @current_user["id"]})
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "user_id" => @current_user["id"], "place_id" => @place["id"]})#, "user_id" => session["id"] })
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place["user_id"] = @current_user["id"]
    @place.save
    redirect_to "/places"
  end

end
