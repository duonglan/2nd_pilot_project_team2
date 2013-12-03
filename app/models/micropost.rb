class Micropost < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	default_scope -> {order('created_at DESC')}
	validates :content, presence: true, length: {maximum: 300}
  	validates :user_id, presence: true
end
