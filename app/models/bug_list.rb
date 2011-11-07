class BugList < ActiveRecord::Base
  @@STATUSES = ["Active", "Completed"]

  belongs_to :project
  belongs_to :user
  has_many :bug_posts, :dependent=>:destroy
  
  validates_presence_of :title, :status, :project_id
  validates_uniqueness_of :title
  validates :status, :inclusion =>{:in => @@STATUSES, :message=>"%{value} is not a valid status"}

 
  def self.statuses
    return @@STATUSES
  end
  
  def no_of_unclosed_bugs
    return BugPost.where(:bug_list_id=>self.id).where("status <> 'Closed'").count
  end
  
  def no_of_closed_bugs
    return BugPost.where(:bug_list_id=>self.id, :status=>"Closed").count
  end
  
  def no_of_bugs
    return BugPost.count
  end
  
  def unclosed_bug_posts
    return BugPost.where(:bug_list_id=>self.id).where("status <> 'Closed'")
  end
end
