class Experience < ActiveRecord::Base
  #belongs_to: :profile
  validates :job_title, presence: true, uniqueness: {scope: :user}
  validates :company, presence: true
end
