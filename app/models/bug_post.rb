class BugPost < ActiveRecord::Base
  @@STATUSES = ["For Fixing", "For Testing", "Testing", "Closed", "Could not replicate"]
  @@PRIORITIES = ["Critical", "High", "Normal", "Low", "Non-critical"]
  
  belongs_to :bug_category
  belongs_to :bug_list, :counter_cache=>true
  belongs_to :posted_for, :class_name=>"User", :foreign_key=>"posted_for_id"
  belongs_to :posted_by, :class_name=>"User", :foreign_key=>"posted_by_id", :counter_cache=>true
  has_many :bug_comments, :dependent=>:destroy
  
  validates_presence_of :title, :body, :status, :bug_list_id, :posted_by_id, :posted_for_id
  validates_uniqueness_of :title
  validates :status, :inclusion => {:in=>@@STATUSES,:message=>"%{value} is not a valid status."}
  validates :priority, :inclusion => {:in=>@@PRIORITIES,:message=>"%{value} is not a valid priority."}

  before_save :set_closed_datetime
  before_update :add_no_of_fixes_and_tests
  after_save :send_notification
  
  attr_accessor :previous_status

  def self.statuses
    return @@STATUSES
  end
  
  def self.priorities
    return @@PRIORITIES
  end
  
  

  
  
  private
		def set_closed_datetime
		  if self.status == 'Closed' 
		    self.closed_datetime = DateTime.now
		  end
		end

		def add_no_of_fixes_and_tests
			previous = self.previous_status
			current = self.status
			if(previous == "For Fixing" && (current == "For Testing" || current == "Testing"))
			  self.no_of_fixes += 1
			elsif(previous == "For Testing" && (current == "For Fixing" || current == "Fixing"))
			  self.no_of_tests += 1
			end
		end

		def send_notification
		  bug_path = "/projects/#{self.bug_list.project_id}/bug_lists/#{self.bug_list_id}/bug_posts/#{self.id}"
		  notification = UserNotification.new
		  notification.title = "#{self.title}[#{self.status}]"
		  notification.body = "%.30s..." % self.body
		  notification.notification_url = bug_path
		  notification.sent_to = self.posted_for
		  notification.sent_by = self.posted_by
		  notification.save
		end

  
end
