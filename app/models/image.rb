class Image < ActiveRecord::Base
  belongs_to :album
  has_attached_file :image, :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }

<<<<<<< HEAD
  scope :all_image_user, ->user_id{where user_id: user_id}    
=======
  scope :all_image_user, ->user_id{where user_id: user_id}
>>>>>>> 9650d485c6259f6d6a52961f06f67b8ff0797118
end