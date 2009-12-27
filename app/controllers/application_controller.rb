# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem

  def check_poll_access
    
    if (params[:controller] && params[:id]) || (params[:poll_id])
      unless current_user
        @poll =  Poll.find_by_id(params[:poll_id])
      else
        @poll =  current_user.polls.find_by_id(params[:controller] == 'polls' ? params[:id] : params[:poll_id])
      end
      if @poll == nil
        flash[:notice] = 'You do not have access to this poll'
        redirect_to(polls_path)
      else
        @anketas = Anketa.find_all_by_poll_id(params[:id])
      end
    end
  end

  def get_anketa
    @anketa = Anketa.find_by_id(params[:anketa_id])
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
