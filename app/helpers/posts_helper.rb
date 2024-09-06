module PostsHelper
  def is_liked(post)
    # current_user.likes.find_by(lik: post.id).present? if current_user != nil
    Like.find_by(likeable_id: post.id, likeable_type: "Post", user_id: current_user.id).present? if current_user != nil
  end

  def is_comment_liked(comment)
    Like.find_by(likeable_id: comment.id, likeable_type: Comment.name, user_id: current_user.id)  if current_user != nil
  end
end
