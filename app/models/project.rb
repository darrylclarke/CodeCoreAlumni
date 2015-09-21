class Project < ActiveRecord::Base
  belongs_to :user
  
  validates :title,       presence: true
  validates :description, presence: true
  validates :date,        presence: true
  
  scope :latest_first, lambda { order ("date DESC") }

end
