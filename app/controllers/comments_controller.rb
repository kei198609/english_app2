class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    post.create_notification_comment!(current_user, comment.id)#通知作成メソッドの呼び出し
    redirect_to post_path(post)
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end