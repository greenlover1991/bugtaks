class TaskLedgersController < ApplicationController
  
  before_filter :require_user_privilege
  def new
    @task_ledger = TaskLedger.new(:project_id=>params[:project_id], :task_id=>params[:task_id])
  end
  
	def create
	  @task_ledger = TaskLedger.new(params[:task_ledger])
	  @task_ledger.is_manual = true
	  @task_ledger.user_id = session[:user_id]
	  respond_to do |format|
      if @task_ledger.save
        format.html { redirect_to(@task_ledger.project, :notice => 'Task Ledger was successfully created.') }
        format.xml  { render :xml => @task_ledger, :status => :created, :location => @task_ledger }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task_ledger.errors, :status => :unprocessable_entity }
      end
    end
	end
	
	
  def destroy

    @task_ledger = TaskLedger.find(params[:id])
    project_id = @task_ledger.project_id
    @task_ledger.destroy
		  
	  respond_to do |format|
	  	format.html { redirect_to project_path(project_id) }
	    format.js { render :nothing=>true}
	  end
  end

  # GET /task_ledgers/1/edit
  def edit
    @task_ledger = TaskLedger.find(params[:id])
    redirect_to @task_ledger.project if @task_ledger.status == "Active" || @task_ledger.user_id != session[:user_id]
  end

  # PUT /task_ledgers/1
  # PUT /task_ledgers/1.json
  def update
    @task_ledger = TaskLedger.find(params[:id])
    @task_ledger.is_manual = true
    respond_to do |format|
      if @task_ledger.update_attributes(params[:task_ledger])
        format.html { redirect_to @task_ledger.project, notice: 'TaskLedger was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_ledger.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def stop
	  task_ledger = TaskLedger.find(params[:id])
    begin
      @project = Project.find(params[:original_project_id]) 
    rescue
      @project = nil
    end
	  if(!session[:task_ledger_id].nil?)
		  session[:task_ledger_id] = nil
		  task_ledger.end_datetime = DateTime.now
		  task_ledger.description = params[:description]
		  task_ledger.is_manual = false
		  task_ledger.save
    end
    respond_to do |format|
      format.html { redirect_to project_path(params[:project_id]) }
			format.js { render :layout=>false}
    end

  end
  
  def start
    @project = Project.find(params[:project_id])
    if(session[:task_ledger_id].nil?)
      d = DateTime.now
      task_ledger = TaskLedger.create(:project_id=>params[:project_id], :task_id=>params[:task_id], :user_id=>session[:user_id], :start_datetime=>d)
      session[:task_ledger_id] = task_ledger.id
    end
    respond_to do |format|
      format.html { redirect_to project_path(params[:project_id]) }
			format.js { render :layout=>false}
    end
  end
  
  private 
    def require_user_privilege
      project = Project.find(params[:project_id])
      redirect_to projects_url unless project.user_ids.include?session[:user_id]
    end
end
