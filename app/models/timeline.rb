class Timeline < ActiveRecord::Base
  enum lifecycle: [ :not_given, :prospect , :applicant , :reserved, :new_student, :continuing_student, :graduating, :alumni ]
  
  has_many :taggings, dependent: :destroy
  has_many :projects, through: :taggings
end

