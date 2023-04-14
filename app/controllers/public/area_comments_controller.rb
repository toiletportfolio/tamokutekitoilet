class Public::AreaCommentsController < ApplicationController

  def create
    area = Area.find(params[:area_id])
    comment = current_user.area_comments.new(area_comment_params)
    comment.area_id = area.id
    comment.save
    redirect_to area_path(area)
  end

  def destroy
    AreaComment.find(params[:id]).destroy
    redirect_to area_path(params[:area_id])
  end

  private

  def area_comment_params
    params.require(:area_comment).permit(:comment)
  end
end
