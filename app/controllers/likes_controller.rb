class LikesController < ApplicationController
  before_action :find_post
  before_action :find_comment
  def create
    if current_user
      @post.likes.create(likeable_id: @post.id, user_id: current_user.id, likeable_type: Post.name)
    end
  end

  def destroy
    if current_user
      record = Like.find_by(likeable_id: @post.id, user_id: current_user.id, likeable_type: Post.name)
      Like.destroy(record.id)
    end
  end

  def create_comment_like
    @comment.likes.create(likeable_id: @comment.id, user_id: current_user.id, likeable_type: Comment.name)
  end

  def destroy_comment_like
    comment = Like.find_by(likeable_id: @comment.id, user_id: current_user.id, likeable_type: Comment.name)
    Like.destroy(comment.id)
  end

  private
  def find_post
    @post = Post.find_by(id: params[:post_id])
  end

  def find_comment
    @comment = Comment.find_by(id: params[:comment_id])
  end
end