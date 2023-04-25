class Admin::AreaCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @area_comments = AreaComment.all
  end

  def show
    @area_comment = AreaComment.find(params[:id])
  end

  def edit
    @area_comment = AreaComment.find(params[:id])
  end

  def update
    @area_comment = AreaComment.find(params[:id])
    if @area_comment.update(area_comment_params)
      flash[:notice] = "変更保存しました"
      redirect_to area_comment_path(@area_comment)
    else
      render :edit
    end
  end

  def destroy
    AreaComment.find(params[:id]).destroy
    flash[:notice] = "削除しました"
    redirect_to area_comments_path
  end

  private

  def area_comment_params
    params.require(:area_comment).permit(:comment)
  end
end
