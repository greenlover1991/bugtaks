class TaskLedger < ActiveRecord::Base
  @@STATUSES = ["Active", "Stopped"]
  belongs_to :project, :touch=>:updated_at
  belongs_to :task
  belongs_to :user
 
  validates_presence_of :project_id, :task_id, :user_id
  validates :status, :inclusion=>{:in=>@@STATUSES, :message=>"%{value} is not a valid status."}
  validate :start_datetime_cannot_be_greater_than_end_datetime
  before_save :calculate_duration


  def self.statuses
    return @@STATUSES
  end
 
  def self.find_active_task_id_of_user_id(user_id)
    if !user_id.nil?
      tl = TaskLedger.find_by_status_and_user_id("Active", user_id)
      tl.id if !tl.nil?
    end
  end
 
  private
    def calculate_duration
      if(self.end_datetime)
        self.duration = (self.end_datetime - self.start_datetime) / 60 / 60
        self.status = "Stopped"
      else
        self.status = "Active"
      end
    end
    
    def start_datetime_cannot_be_greater_than_end_datetime
      if !end_datetime.nil? and start_datetime > end_datetime
        errors.add(:start_datetime, "can't be later than end datetime")
      end
    end

end
