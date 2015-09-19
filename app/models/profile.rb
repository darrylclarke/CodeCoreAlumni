class Profile < ActiveRecord::Base
  
  mount_uploader :avatar, AvatarUploader
  mount_uploader :resume, ResumeUploader

  validates :description_long, presence: true
  validates :description_short, presence: true

end
