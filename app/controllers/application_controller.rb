# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem

  before_filter :get_poll_anketa #фільтр для визначення залежного poll анкети

  def get_poll_anketa
    @poll = Poll.find_by_id(params[:poll_id])
    @anketa = Anketa.find_by_id(params[:anketa_id]) #ВИБІР анкети по id
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
