class Person < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :projects, through: :taggings
  enum group: [ :student, :faculty, :employee]
  validates :name, presence: true
  validates :group, presence: true
end
