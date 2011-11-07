class UserNotificationsController < ApplicationController
  def index
    @notifications = UserNotification.where(:sent_to_id=>session[:user_id])
  end
  
  def destroy
    @notification = UserNotification.find(params[:id])
    @notification.destroy
	  respond_to do |format|
	  	format.html { redirect_to user_notifications_path }
	    format.js { render :nothing=>true}
	  end
  end

end
