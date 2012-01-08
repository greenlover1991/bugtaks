class BugComment < ActiveRecord::Base
  belongs_to :bug_post
  belongs_to :user
  
  validates_presence_of :body, :bug_post_id, :user_id
  
	after_create :send_notification
	
	private
		def send_notification
		  bug_path = "/projects/#{self.bug_post.bug_list.project_id}/bug_lists/#{self.bug_post.bug_list_id}/bug_posts/#{self.bug_post_id}"
		  notification = UserNotification.new
		  notification.title = "#{self.user.screen_name} commented on #{self.bug_post.title}"
		  notification.body = "%.30s..." % self.body
		  notification.notification_url = bug_path
		  notification.sent_to = self.bug_post.posted_for
		  notification.sent_by = self.user
		  notification.save
		end
end
