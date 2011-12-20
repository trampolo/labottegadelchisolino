class ApplicationController < ActionController::Base
  include UserSessionsHelper
  include ApplicationHelper
  protect_from_forgery
  
  helper_method :current_user
  
  before_filter :load_gallery

  def notfound
    flash[:error] = "La pagina che hai richiesto non esiste"
    redirect_to root_url
  end
  
  def load_gallery
    if @pictures.nil?
      #@pictures = Picture.paginate(:page => params[:page], :per_page => 3)  
      @pictures = Picture.find_by_sql("select * from pictures ORDER BY RANDOM() LIMIT 3")
    end
  end
  
end
