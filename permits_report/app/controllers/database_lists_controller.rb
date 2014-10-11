class DatabaseListsController < ApplicationController
  before_action :set_databaselist, only: [:show, :edit, :update]	
  
  def index
      params[:empty] = 1
      if params[:comment]
        @databaselists = DatabaseList.where("comment LIKE ?", "%#{params[:comment]}%")
        if @databaselists.blank?
          @databaselists = DatabaseList.all
          params[:empty] = 0
        end
      else
		    @databaselists = DatabaseList.all
      end
  end

  def new
	@databaselist = DatabaseList.new
  end

  def create
    @databaselist = DatabaseList.new(databaselist_params)

    respond_to do |format|
      if @databaselist.save
        format.html { redirect_to @databaselist, notice: 'databaselist was successfully created.' }
        format.json { render :show, status: :created, location: @databaselist }
      else
        format.html { render :new }
        format.json { render json: @databaselist.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def filter
  	if params[:comment]
      @databaselists = DatabaseList.where("comment LIKE ?", "%#{params[:comment]}%")
    elsif params[:q]
       @databaselists = DatabaseList.where("comment LIKE ?", "%#{params[:q]}%")
    else
       @databaselists = DatabaseList.all
    end
  end

  def update
    respond_to do |format|
      if @databaselist.update(databaselist_params)
        format.html { redirect_to @databaselist, notice: 'databaselist was successfully updated.' }
        format.json { render :show, status: :ok, location: @databaselist }
      else
        format.html { render :edit }
        format.json { render json: @databaselist.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_databaselist
      @databaselist = DatabaseList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def databaselist_params
      params.require(:database_list).permit(:state, :area_type, :state_abb, :state_full, :dbname, :link, :comment, :scripter)
    end
end

