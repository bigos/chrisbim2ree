class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id
  belongs_to :post

  after_create :new_comment_notification

  def new_comment_notification
    CommentMailer.new_comment_admin_notification(self).deliver
  end
end
