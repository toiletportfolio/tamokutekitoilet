class Admin::AreasController < ApplicationController
  before_action :authenticate_admin!

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    @area.update(area_params)
    redirect_to admin_area_path(@area.id)
  end

  def destroy
    area = Area.find(params[:id])
    area.destroy
    redirect_to admin_areas_path
  end

  private

  def area_params
    params.require(:area).permit(:user_id, :area_name, :address, :facilities, :handrail, :washlet, :open_time, :close_time)
  end
end
