class Task < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_many :task_ledgers, :dependent=>:destroy

  validates_presence_of :name
  validates_uniqueness_of :name

  def parent_tasks
    if self.id
      return Task.where("id != #{self.id}") 
    else
      return Task.all
    end
  end

  #must find another solution than recursive querying
  def self.subtasks(task, &block)
    yield 1
    yield task
    tasks = []
    s_tasks = Task.select([:id, :name, :description]).where(:task_id =>task)
    if s_tasks.empty?
      yield -1
      return
    else
      s_tasks.each do |t|
        tasks << t
        tasks << subtasks(t,&block)
      end
      yield -1
      return tasks.compact
    end
    
  end 
    
   
end
