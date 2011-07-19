class ApplicationController < ActionController::Base
  helper :Users
  require 'authlogic'
  protect_from_forgery
  helper_method :current_user_session, :current_user, :follow_toggle, :follow_toggle_logic

  private
    def follow_toggle
      return current_user==@user ? "" : @unique_user==nil ? "Follow" : "Un-Follow"
    end
    
    def follow_toggle_logic
      return user_follows_path(current_user, {:follow=>{:follow_id=>@user.id, :user_id=>current_user.id}})
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    def require_user 
     unless current_user  
       flash[:notice] = "You must be logged in to access this page" 
       redirect_to login_path 
       return false 
     end 
   end 

   def require_no_user 
     if current_user  
       flash[:notice] = "You must be logged out to access this page" 
       redirect_to root_url 
       return false 
     end 
   end   
end
