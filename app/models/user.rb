class User < ActiveRecord::Base
  belongs_to :role
  has_and_belongs_to_many :projects
  has_many :bug_lists
  has_many :bug_comments
  has_many :bug_posts

  
  validates_presence_of :user_name, :password, :password_confirmation, :screen_name
  validates_uniqueness_of :user_name, :password, :screen_name
  validates_confirmation_of :password
    
  before_save :hashify
  
  attr_accessor :old_password

  def join(project)
    self.projects << project
  end
  
  def unjoin(project)
    self.projects.delete(project)
  end
  
  def self.login(user)
    return (User.find_by_user_name_and_password(user.user_name, Digest::SHA1.hexdigest(user.password)))
  end

  def verify_old_password(old_password)
    if Digest::SHA1.hexdigest(old_password) == self.password
      return true
    else
      self.errors[:old_password] << " does not match old password"
      return false
    end
  end
  
  def posts_posted_by_me
    return BugPosts.where(:posted_by_id=>self.id)
  end
  
  def posts_posted_for_me
    return BugPosts.where(:posted_for_id=>self.id)
  end
  
  private
		def hashify
		  self.password = Digest::SHA1.hexdigest(self.password)
		end
   
end
