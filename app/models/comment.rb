class Comment < ActiveRecord::Base
	belongs_to :micropost
	default_scope -> {order('created_at DESC')}
	validates :content, presence: true
  	validates :micropost_id, presence: true
end
