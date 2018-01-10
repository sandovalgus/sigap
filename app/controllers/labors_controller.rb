class LaborsController < ApplicationController
  before_action :set_labor, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  respond_to :html, :json

  # GET /labors
  # GET /labors.json
  def index
    @labor = Labor.new
    if params[:id]
      @employee = Employee.find(params[:id])
      cookies[:employee_id] = params[:id]
    else
      @employee = Employee.find(cookies[:employee_id])
    end
    @labors = Labor.left_outer_joins(:general_direction, :direction, :department, :function)
                    .where(employee_id: cookies[:employee_id])
                    .order(id: :desc)
                    .all
    # @count = expired_counts(@labors)
  end
  
  # funcion que determina los contratos que estan a punto de expirar
  # def unexpired_contracts(labors)
  #   @labors = Labor.new
  #   #today = Time.now.to_s
  #   @labors = Labor.joins(:general_direction, :direction, :department, :function, :employee).order(departure_date: :desc).all
  # end
  
  # #Cantidad de contratos a vencer
  # def expired_counts(labors) 
  #   count ||= 0
  #   labors.each do |l|
  #     if l.departure_date.present? && l.departure_date.future?
  #       expired = ((l.departure_date).to_date - (Time.now.to_s).to_date).to_i
  #       if expired.present? && expired <= 31
  #         count++
  #       end
  #     end
  #   end
  #   return count
  # end

  # GET /labors/1
  # GET /labors/1.json
  def show
    respond_modal_with @labor
  end

  # GET /labors/new
  def new
    @employee = Employee.find(cookies[:employee_id])
    @labor = Labor.new
    respond_modal_with @labor
  end

  # GET /labors/1/edit
  def edit
    respond_modal_with @labor
  end

  # POST /labors
  # POST /labors.json
  def create
    @employee = Employee.find(cookies[:employee_id])
    @labor = Labor.create(labor_params)
    @labor.employee_id = @employee.id
    if @labor.permanent_plant_pass
      @labor.departure_date_indefinite = 1
      @labor.departure_date = nil
      @labor.contracting_regime = 'Planta Permanente'
    end
    if @labor.save
      respond_modal_with @labor, location: labors_path
    end
  end

  # PATCH/PUT /labors/1
  # PATCH/PUT /labors/1.json
  def update
    #if params[:bandera].to_i == 2 
    respond_to do |format|
      if @labor.update(labor_params)
        format.html { redirect_to labors_path, notice: 'Se ha actualizado el dato laboral.' }
        format.json { render :show, status: :ok, location: @labor }
      else
        format.html { render :edit }
        format.json { render json: @labor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labors/1
  # DELETE /labors/1.json
  def destroy
    @labor.destroy
    respond_to do |format|
      format.html { redirect_to labors_url, notice: 'El dato laboral ha sido eliminado.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labor
      @labor = Labor.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def labor_params
      params.require(:labor).permit(:function_id, :employee_id, :entry_date, :departure_date, :status, :permanent_plant_pass, :adscribed, :adscribed_organization_name, :departure_date_indefinite, :takeover_date, :contracting_regime, :legal_instrument, :category, attachment_files_attributes: [:id, :name, :document, :document_cache, :commentary, :_destroy])
    end
end