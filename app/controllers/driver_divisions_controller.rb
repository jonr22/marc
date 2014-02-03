class DriverDivisionsController < ApplicationController
  before_action :set_driver_division, only: [:show, :edit, :update, :destroy]

  # GET /driver_divisions
  # GET /driver_divisions.json
  def index
    @driver_divisions = DriverDivision.all
  end

  # GET /driver_divisions/1
  # GET /driver_divisions/1.json
  def show
  end

  # GET /driver_divisions/new
  def new
    @driver_division = DriverDivision.new
  end

  # GET /driver_divisions/1/edit
  def edit
  end

  # POST /driver_divisions
  # POST /driver_divisions.json
  def create
    @driver_division = DriverDivision.new(driver_division_params)

    respond_to do |format|
      if @driver_division.save
        format.html { redirect_to @driver_division, notice: 'Driver division was successfully created.' }
        format.json { render action: 'show', status: :created, location: @driver_division }
      else
        format.html { render action: 'new' }
        format.json { render json: @driver_division.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /driver_divisions/1
  # PATCH/PUT /driver_divisions/1.json
  def update
    respond_to do |format|
      if @driver_division.update(driver_division_params)
        format.html { redirect_to @driver_division, notice: 'Driver division was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @driver_division.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driver_divisions/1
  # DELETE /driver_divisions/1.json
  def destroy
    @driver_division.destroy
    respond_to do |format|
      format.html { redirect_to driver_divisions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver_division
      @driver_division = DriverDivision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_division_params
      params.require(:driver_division).permit(:name)
    end
end
