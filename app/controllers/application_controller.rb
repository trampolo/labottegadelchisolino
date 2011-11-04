class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def notfound
    flash[:error] = "La pagina che hai richiesto non esiste"
    redirect_to root_url
  end
end
