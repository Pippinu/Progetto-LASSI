class ApplicationController < ActionController::Base
    # The before_action filter is called before the specified actions. 
    # In our case it will be called on all actions whose controller inherit from our application controller.
    before_action :require_login

    # Permette di ottenere l'utente attualemente loggato
    helper_method :current_user

    def require_login
      redirect_to new_session_path unless session.include? :user_id
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
