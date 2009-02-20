# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '79ef2d5de96959c0117e9a46147298ca'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  ################## login acessor ###################
  #before_filter :get_user

   protected
    def user_authenticate
      User.find(session[:user_id])
    end

    def login_required
      return true if session[:user_id]
      access_denied
      return false
    end

    def access_denied
      session[:return_to] = request.request_uri
      flash[:notice] = 'voce precisa estar logado para acessar esta página.'
      redirect_to :controller => 'login', :action => 'index'
    end
  ################## login acessor ###################
end
