class ApplicationController < ActionController::Base
	helper :all
	protect_from_forgery
	config.filter_parameters :password, :password_confirmation
	#helper_method :current_user, :current_user_session

  private
  def current_responsable_session
    @current_responsable_session ||= ResponsableSession.find
  end
  
  def current_responsable
    #return @current_responsable = Responsable
    @current_responsable ||= current_responsable_session && current_responsable_session.record
  end
    
    def require_responsable
      unless current_responsable
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_responsable_session_url
        return false
      end
    end

    def require_no_responsable
      if current_responsable
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to new_responsable_url
        return false
      end
    end
     def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
end
