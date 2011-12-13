class ApplicationController < ActionController::Base
  include UserSessionsHelper
  include ApplicationHelper
  protect_from_forgery
  
  helper_method :current_user

  def notfound
    flash[:error] = "La pagina che hai richiesto non esiste"
    redirect_to root_url
  end
end
