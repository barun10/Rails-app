class OfficersController < ApplicationController
  before_action :set_officer, only: [:show, :edit, :update, :destroy]

  def index
    @officers = Officer.all
    @search = params["search"]
		
		if @search.present?
			@query = @search[:query]
    	@officers = Officer.where("name LIKE ?" ,"%#{@query}%") .or(Officer.where("email LIKE ?" ,"%#{@query}%"))
		end
		end
  def show
  end

  def new
    @officer = Officer.new
  end

  def edit
  end


  def create
    @officer = Officer.new(officer_params)

    respond_to do |format|
      if @officer.save
        format.html { redirect_to @officer, notice: 'Officer was successfully created.' }
        format.json { render :show, status: :created, location: @officer }
      else
        format.html { render :new }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @officer.update(officer_params)
        format.html { redirect_to @officer, notice: 'Officer was successfully updated.' }
        format.json { render :show, status: :ok, location: @officer }
      else
        format.html { render :edit }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @officer.destroy
    respond_to do |format|
      format.html { redirect_to officers_url, notice: 'Officer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_officer
      @officer = Officer.find(params[:id])
    end

    def officer_params
      params.require(:officer).permit(:name, :email)
    end
end
