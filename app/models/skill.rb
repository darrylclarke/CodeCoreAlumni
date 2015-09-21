class Skill < ActiveRecord::Base
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end
