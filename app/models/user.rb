class User < ActiveRecord::Base

  has_secure_password
  has_one :skill
  has_one :profile
  has_many :projects, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :contacts, dependent: :destroy

  validates :email, presence: true, uniqueness: true,
        #google ruby email regex to get
          format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def generate_password_reset_token!
    update_attribute(:password_reset_token, SecureRandom.urlsafe_base64(45))
  end

  extend FriendlyId
	friendly_id :slug_candidates, use: [:slugged, :history]

  def slug_candidates
    [
      [:first_name, :last_name],
      [:first_name, :last_name, :id]
    ]
  end

  def self.pending_user_list
    where(is_active: false)
  end
  def self.active_user_list
    where(is_active: true)
  end
  def self.admin_user_list
    where(is_admin: true)
  end
  def self.not_admin_user_list
    where(is_admin: false)
  end

end
