class Experience < ActiveRecord::Base
  belongs_to :user
  validates :job_title, presence: true
  validates :company, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  # end_date does not need to be present. In this case, we treat this as PRESENT
  # e.g. March 2010 - Present (present means end_date = nil)
end
