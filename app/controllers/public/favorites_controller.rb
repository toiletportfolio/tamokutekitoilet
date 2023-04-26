class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.page(params[:page]).per(5)
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
