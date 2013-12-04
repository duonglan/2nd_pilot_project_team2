class Comment < ActiveRecord::Base
	belongs_to :micropost
	default_scope -> {order('created_at DESC')}
	validates :content, presence: true, length: {maximum: 100}
  	validates :micropost_id, presence: true
end
