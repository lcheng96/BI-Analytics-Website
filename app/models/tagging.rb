class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :project
  belongs_to :timeline
  belongs_to :person
  belongs_to :location
  accepts_nested_attributes_for :tag
  accepts_nested_attributes_for :timeline
end
