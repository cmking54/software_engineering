class ApplicationController < ActionController::Base
  helper_method :current_person

  def current_person
    @current_person = if session[:user_id] then Person.find(session[:user_id]) else nil end
  end

end
