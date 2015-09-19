class Education < ActiveRecord::Base
  belongs_to :user

  validates   :degree, presence: true
  validates   :institution, presence: true
  validates   :desc, presence: true
  validates   :year, presence: true
end
