class Image < ActiveRecord::Base
  belongs_to :album
  has_attached_file :image, :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }

  scope :all_image_user, ->user_id{where user_id: user_id}    
end