class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id, :name, :published
  belongs_to :post, :inverse_of => :comments

  validates :content, :presence => true
  validates :name, :presence => true
  after_create :new_comment_notification

  def new_comment_notification
    CommentMailer.new_comment_admin_notification(self).deliver
  end
end
