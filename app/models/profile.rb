class Profile < ActiveRecord::Base
  belongs_to :user

  mount_uploader :avatar, AvatarUploader
  mount_uploader :resume, ResumeUploader

  validates :description_long, presence: true, length: {maximum: 500}
  validates :description_short, presence: true, length: { maximum: 140 }
end
