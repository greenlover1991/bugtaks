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
  
  
  
  
  private 
    def start_date_cannot_be_greater_than_end_date
      if !end_date.nil? and start_date > end_date
        errors.add(:start_date, "can't be later than end date")
      end
    end
  
end
