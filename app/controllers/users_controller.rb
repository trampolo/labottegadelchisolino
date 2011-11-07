class UsersController < ApplicationController
  before_filter :require_user, :only => [:edit, :update, :new, :create]
  
  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:page])
        format.html { redirect_to root_url, notice: "L'utente e' stato aggiornato correttamente." }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
  def create
    @user = User.new(params[:food])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "Utente creato correttamente." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
