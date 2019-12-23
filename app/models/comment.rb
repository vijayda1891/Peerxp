class Comment < ApplicationRecord
	require 'carrierwave/orm/activerecord'
  
  belongs_to :task

   mount_uploader :file_attachment, AvatarUploader
end
