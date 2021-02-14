class Api::FavouritesController < ApplicationController

  def show
    favourites = Favourite.where(favouriter: params["user_id"])
    render json: favourites
  end

  def create
    favourite = Favourite.new(favouriter: params["user_id"], favouritee: params["favourite_id"])
    render json: favourite
  end
end
