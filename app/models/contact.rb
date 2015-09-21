class Contact < ActiveRecord::Base
  belongs_to :user

  validates :email, presence: true, uniqueness: true,
        #google ruby email regex to get
          format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
end
