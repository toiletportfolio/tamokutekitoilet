class Public::FavoritesController < ApplicationController

  def index
  end

  def create
    area = Area.find(params[:area_id])
    favorite = current_user.favorites.new(area_id: area.id)
    favorite.save
    redirect_to area_path(area)
  end

  def destroy
    area = Area.find(params[:area_id])
    favorite = current_user.favorites.find_by(area_id: area.id)
    favorite.destroy
    redirect_to area_path(area)
  end
end
