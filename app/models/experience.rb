class Experience < ActiveRecord::Base
  #belongs_to: :profile
  validates :job_title, presence: true
  validates :company, presence: true
end
