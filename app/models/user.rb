class User < ActiveRecord::Base

  has_secure_password

  has_many :projects, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  

  validates :email, presence: true, uniqueness: true,
        #google ruby email regex to get
          format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def liked_question?(question)
    liked_questions.include?(question)
  end

  def favorited_question?(question)
    favorited_questions.include?(question)
  end

end
