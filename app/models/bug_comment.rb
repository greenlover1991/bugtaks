class BugComment < ActiveRecord::Base
  belongs_to :bug_post
  belongs_to :user
  
  validates_presence_of :body, :bug_post_id, :user_id
end
