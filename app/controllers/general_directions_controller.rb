class GeneralDirectionsController < ApplicationController
  before_action :set_general_direction, only: [:show, :edit, :update, :destroy]

  # GET /general_directions
  # GET /general_directions.json
  def index
    @general_directions = GeneralDirection.all
  end

  # GET /general_directions/1
  # GET /general_directions/1.json
  def show
  end

  # GET /general_directions/new
  def new
    @general_direction = GeneralDirection.new
  end

  # GET /general_directions/1/edit
  def edit
  end

  # POST /general_directions
  # POST /general_directions.json
  def create
    @general_direction = GeneralDirection.new(general_direction_params)

    respond_to do |format|
      if @general_direction.save
        format.html { redirect_to @general_direction, notice: 'General direction was successfully created.' }
        format.json { render :show, status: :created, location: @general_direction }
      else
        format.html { render :new }
        format.json { render json: @general_direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_directions/1
  # PATCH/PUT /general_directions/1.json
  def update
    respond_to do |format|
      if @general_direction.update(general_direction_params)
        format.html { redirect_to @general_direction, notice: 'General direction was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_direction }
      else
        format.html { render :edit }
        format.json { render json: @general_direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_directions/1
  # DELETE /general_directions/1.json
  def destroy
    @general_direction.destroy
    respond_to do |format|
      format.html { redirect_to general_directions_url, notice: 'General direction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_direction
      @general_direction = GeneralDirection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def general_direction_params
      params.require(:general_direction).permit(:name)
    end
end
