class RaceClassesController < ApplicationController
  before_action :set_race_class, only: [:show, :edit, :update, :destroy]

  # GET /race_classes
  # GET /race_classes.json
  def index
    @race_classes = RaceClass.all
  end

  # GET /race_classes/1
  # GET /race_classes/1.json
  def show
  end

  # GET /race_classes/new
  def new
    @race_class = RaceClass.new
  end

  # GET /race_classes/1/edit
  def edit
  end

  # POST /race_classes
  # POST /race_classes.json
  def create
    @race_class = RaceClass.new(race_class_params)

    respond_to do |format|
      if @race_class.save
        format.html { redirect_to @race_class, notice: 'Race class was successfully created.' }
        format.json { render action: 'show', status: :created, location: @race_class }
      else
        format.html { render action: 'new' }
        format.json { render json: @race_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /race_classes/1
  # PATCH/PUT /race_classes/1.json
  def update
    respond_to do |format|
      if @race_class.update(race_class_params)
        format.html { redirect_to @race_class, notice: 'Race class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @race_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /race_classes/1
  # DELETE /race_classes/1.json
  def destroy
    @race_class.destroy
    respond_to do |format|
      format.html { redirect_to race_classes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_race_class
      @race_class = RaceClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def race_class_params
      params.require(:race_class).permit(:name)
    end
end
