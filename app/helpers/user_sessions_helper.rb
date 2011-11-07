module UserSessionsHelper
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
    
  def current_user
    @current_user = current_user_session && current_user_session.record
  end
    
  def require_user
    unless current_user
      store_location
      flash[:error] = "Devi autenticarti per accedere a questa pagina."
      redirect_to new_user_session_path
      return false
    end
  end 
  
  def store_location
    session[:return_to] = request.fullpath
  end   
  
  def clear_return_to
    session[:return_to] = nil
  end
end
