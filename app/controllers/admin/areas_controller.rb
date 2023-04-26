class Admin::AreasController < ApplicationController
  before_action :authenticate_admin!

  def index
    @areas = Area.all.page(params[:page]).per(5)
  end

  def show
    @area = Area.find(params[:id])
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    if @area.update(area_params)
      flash[:notice] = "変更保存しました"
      redirect_to admin_area_path(@area.id)
    else
      render :edit
    end
  end

  def destroy
    area = Area.find(params[:id])
    area.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_areas_path
  end

  private

  def area_params
    params.require(:area).permit(:user_id, :area_name, :address, :facilities, :handrail, :washlet, :open_time, :close_time)
  end
end
