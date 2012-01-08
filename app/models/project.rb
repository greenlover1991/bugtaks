class Project < ActiveRecord::Base
  @@STATUSES = ["Active", "Inactive", "Completed"]
  
  has_and_belongs_to_many :tasks
  has_many :task_ledgers, :dependent=>:destroy
  has_many :bug_lists, :dependent=>:destroy
  has_and_belongs_to_many :users

  validates_presence_of :name, :status
  validates_uniqueness_of :name
  validate :start_date_cannot_be_greater_than_end_date
  validates :status, :inclusion=>{:in=>@@STATUSES, :message=>"%{value} is not a valid status."}
  
 
  def self.statuses
    return @@STATUSES
  end
  
  def can_be_joined_by_user_id?(user_id)
    return !(self.users.include? User.find(user_id))
  end
  
  def total_manhours
  	return "%.2f" % self.task_ledgers.sum(:duration)
  end
  
  def longest_task_name
    tl = longest_task
  	tl.keys[tl.values.index tl.values.max]
  end
  
  def longest_task_value
	  tl = longest_task
		"%.2f" %  tl.values.max
  end
  
  def latest_task_ledger
  	self.task_ledgers.order("start_datetime desc").limit(1)  
  end
  
  private 
    def start_date_cannot_be_greater_than_end_date
      if !end_date.nil? and start_date > end_date
        errors.add(:start_date, "can't be later than end date")
      end
    end
    
    def longest_task
  		self.task_ledgers.joins(:task).group("task_ledgers.task_id, tasks.name").sum(:duration)
  	end
  
end
