class Profile < ActiveRecord::Base

  belongs_to :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  mount_uploader :avatar, AvatarUploader
  mount_uploader :resume, ResumeUploader

  validates :user_id, presence: true, uniqueness: true
  validates :description_long, presence: true, length: {maximum: 500}
  validates :description_short, presence: true, length: { maximum: 140 }

  validate :twitter_url_must_be_valid
  validate :github_url_must_be_valid




  scope :for_hire, -> { where(for_hire: false) }

  # scope :for_hire_all, -> { where(for_hire: false) && Profile.select() }
  # def self.
  #   Profile.select('description_long', 'description_short', 'avatar', 'user_id', 'for_hire?')
  # end


  # extend FriendlyId
	# friendly_id :slug_candidates, use: [:slugged, :history]


  # def slug_candidates
  #   [
  #     [:name, :city],
  #     [:name, :street, :city],
  #     [:name, :street_number, :street, :city]
  #   ]
  # end


  private

  # The twitter URL must begin with the string "https://twitter.com/" or else
  # a record will be added to the error object.  This will trigger error notification
  # in the simple_form_for block.
  def twitter_url_must_be_valid
    if twitter.present? && twitter.downcase.strip.index("https://twitter.com/") != 0
      errors.add(:twitter, "Twitter URL is invalid")
    end
  end

  # The github URL must begin with the string "https://twitter.com/" or else
  # a record will be added to the error object.  This will trigger error notification
  # in the simple_form_for block.
  def github_url_must_be_valid
    if github.present? && github.downcase.strip.index("https://github.com/") != 0
      errors.add(:github, "Github URL is invalid")
    end
  end

end
