class TargetCommentsController < ApplicationController

  before_action :set_target

  def create
    @comment = TargetComment.new(target_comment_paraams)
    @comment.user_id = current_user.id
    @comment.target_id = @target.id
    @comment.save
  end

  def destroy
    @comment = TargetComment.find_by(id: params[:id], target_id: params[:target_id])
    @comment.destroy
  end

  private

  def target_comment_paraams
    params.require(:target_comment).permit(:comment)
  end

  def set_target
    @target = Target.find(params[:target_id])
  end
end
