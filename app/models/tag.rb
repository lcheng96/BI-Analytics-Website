class Tag < ActiveRecord::Base
  
  has_many :taggings, dependent: :destroy
  has_many :projects, through: :taggings

  validates_uniqueness_of :keyword
end
