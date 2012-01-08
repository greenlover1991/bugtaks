class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_login, :except=> [:login,:authenticating]
  before_filter :assign_active_task_ledger_id, :except=> [:login,:authenticating]
  
  def index
    redirect_to '/login' unless session[:user_id]
    
    @projects_joined = Project.joins(:users).where("projects_users.user_id=#{session[:user_id]}")
  end
  
  def login
    redirect_to '/' if session[:user_id]
    @user = User.new
  end  
  
  def authenticating
		if (user = User.login(User.new(params[:user])))
		  session[:user_id] = user.id
		  session[:user_screen_name] = user.screen_name
		  assign_active_task_ledger_id
		  redirect_to '/'  
		else
		  redirect_to '/login'
		end
	end
  
  def logout
    session[:user_id] = nil
    session[:user_screen_name] = nil
    session[:user_name] = nil
    session[:task_ledger_id] = nil
    redirect_to '/login'
  end
  
  private
    def require_login
      redirect_to '/login' unless session[:user_id]
    end
    
    def assign_active_task_ledger_id
      if !session[:user_id].nil?
        session[:task_ledger_id] = TaskLedger.find_active_task_id_of_user_id(session[:user_id])
      end
    end
end
