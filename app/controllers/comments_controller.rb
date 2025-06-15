class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_prams)
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  private
  def comment_prams
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
