class FoodsController < ApplicationController
  before_filter :require_user, :only => [:new, :edit, :destroy, :create, :update]
  before_filter :menu
  
  # GET /foods
  # GET /foods.json
  def index
    type = params[:type]
    fg  = params[:fg]
    @page = Page.find(2)
    @foodTypes = FoodType.all
    @type_id = type

    @foods = Food.find_by_sql(["SELECT * FROM FOODS WHERE food_type_id = ?", type])

    
    @foods = Food.find_by_sql("SELECT * FROM FOODS WHERE important = 't'") if !params.has_key?(:type)
    
    
    if !fg.nil?
      @front_food = Food.find(fg) 
    end if
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @foods }
    end
  end

  # GET /foods/1
  # GET /foods/1.json
  def show

    @food = Food.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food }
    end
  end

  # GET /foods/new
  # GET /foods/new.json
  def new
    @food = Food.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food }
    end
  end

  # GET /foods/1/edit
  def edit
    @food = Food.find(params[:id])
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(params[:food])

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: "Piatto creato correttamente." }
        format.json { render json: @food, status: :created, location: @food }
      else
        format.html { render action: "new" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /foods/1
  # PUT /foods/1.json
  def update
    @food = Food.find(params[:id])

    respond_to do |format|
      if @food.update_attributes(params[:food])
        format.html { redirect_to @food, notice: "Piatto aggiornato correttamente." }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url }
      format.json { head :ok }
    end
  end
  
  def photos
    food = Food.find(params[:id])
    style = params[:style] ? params[:style] : 'original'
    send_data food.photo.file_contents(style), :type => food.photo_content_type    
  end
  
  def menu
    @border_color = "#ff9900"
    @menu_ht = ht
    @title = "Menu"
  end
end
