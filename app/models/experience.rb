class Experience < ActiveRecord::Base
  belongs_to :user
  validates :job_title, presence: true
  validates :company, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
end
