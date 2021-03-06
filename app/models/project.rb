class Project < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings 
  has_many :timelines, through: :taggings
  has_many :people, through: :taggings
  has_many :locations, through: :taggings
  
  accepts_nested_attributes_for :taggings
  def self.search(search)
    if search
      #byebug
      @project = Project.where('description like :search OR name like :search OR link like :search OR category like :search OR update_rate like :search OR typical_user like :search', search: "%#{search}%")
     # if(@project.empty?)
        Tag.where('keyword like :search', search: "%#{search}%").find_each do |tag|
          @project |= @project + tag.projects
        end
        Person.where('name like :search', search: "%#{search}%").find_each do |person|
          @project |= @project + person.projects
         end
        Timeline.where('lifecycle like :search', search: Timeline.lifecycles["#{search}"]).find_each do |timeline|
          @project |= @project + timeline.projects
        end
        Location.where('institution like :search', search: "#%{search}%").find_each do |location|
          @project |= @project + location.projects
        end
        
     # end
    else #update code for a "sorry didn't find anything related to search
      #otherwise show everything if clicked normally
      #raise "Found Nothing"
      @project = self.all
    end
    return @project
  end
  
  def self.tagged_with(name)
    Tag.find_by_keyword!(name).projects
  end
  
  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end
  
  def tag_list
    tags.map(&:keyword).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(keyword: n.strip).first_or_create!
    end
  end
 
end
