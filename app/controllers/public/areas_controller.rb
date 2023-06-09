class Public::AreasController < ApplicationController
  before_action :authenticate_user!

  def new
    @area = Area.new
  end

  def index
    redirect_to new_area_path
  end

  def create
    @area = Area.new(area_params)
    @area.user_id = current_user.id
    if  @area.save
      flash[:notice] = "投稿が成功しました"
      redirect_to area_path(@area.id)
    else
      render :new
    end
  end

  def show
    @area = Area.find(params[:id])
    @area_comment = AreaComment.new
  end

  def edit
    @area = Area.find(params[:id])
    if @area.user == current_user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @area = Area.find(params[:id])
    if @area.update(area_params)
      flash[:notice] = "変更保存しました"
      redirect_to area_path(@area.id)
    else
      render :edit
    end
  end

  def destroy
    area = Area.find(params[:id])
    area.destroy
    flash[:notice] = "削除しました"
    redirect_to root_path
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @areas = Area.search(params[:search]).page(params[:page]).per(5)
  end

  def jmapsearch
    @areas = Area.search(params[:prefecture]).page(params[:page]).per(5)
  end

  private

  def area_params
    params.require(:area).permit(:user_id, :area_name, :address, :facilities, :handrail, :washlet, :open_time, :close_time, :prefecture)
  end
end
