class BugCategory < ActiveRecord::Base
  has_many :bug_posts
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
