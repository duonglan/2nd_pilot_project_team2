class Micropost < ActiveRecord::Base
  EXISTANCE = 0
  name
	belongs_to :user
	has_many :comments, dependent: :destroy
	default_scope -> {order('created_at DESC')}
	validates :content, presence: true, length: {maximum: 300}
  validates :user_id, presence: true

  def is_public?
    self.status == true
  end

  def has_comment?
    self.comments.count != EXISTANCE
  end
end
