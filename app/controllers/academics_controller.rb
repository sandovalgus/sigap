class AcademicsController < ApplicationController
  before_action :set_academic, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  respond_to :html, :json
  
  # GET /academics
  # GET /academics.json
  def index
    # puts "************************"
    # puts params.inspect
    #  @academic = Academic.new
    # # employee_id = cookies[:employee_id]
    # @academics = Academic.where(employee_id: params[:id]).all
    # 

    @academic = Academic.new
    if params[:id]
      @employee = Employee.find(params[:id])
      cookies[:employee_id] = params[:id]
    else
      @employee = Employee.find(cookies[:employee_id])
    end

    # employee_id = cookies[:employee_id]
    @academics = Academic.where(employee_id: cookies[:employee_id]).all
    
  end

  def download
    @document_academic = DocumentAcademic.find(params[:id])
    send_file(@document_academic.document_path,
          :disposition => 'attachment',
          :url_based_filename => false)
  end

  # GET /academics/1
  # GET /academics/1.json
  def show
    if params[:object].present?
      @academic = Academic.where(id: params[:object]).first
    end
    respond_modal_with @academic
  end

  # GET /academics/new
  def new
    # @employee = Employee.find(cookies[:employee_id])
    @academic = Academic.new
    respond_modal_with @academic

  end

  # GET /academics/1/edit
  def edit
    respond_modal_with @academic.document_academics
  end

  # POST /academics
  # POST /academics.json
  def create
    @employee = Employee.find(cookies[:employee_id])
    @academic = Academic.new(academic_params)
    @academic.employee_id = @employee.id
    if @academic.save
      flash[:success] = 'Los datos se guardaron exitosamente.'
      respond_modal_with @academic, location: academics_path
    end
  end

  # PATCH/PUT /academics/1
  # PATCH/PUT /academics/1.json
  def update
    respond_to do |format|
      if @academic.update(academic_params)
        flash[:notice] ='Se han actualizado los datos.' 
        format.html { redirect_to academics_path }
        format.json { render :index, status: :ok, location: @academic }
      else
        format.html { render :edit }
        format.json { render json: @academic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academics/1
  # DELETE /academics/1.json
  def destroy
    @academic.destroy
    respond_to do |format|
      format.html { redirect_to academics_url, notice: 'La formación académica ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic
      @academic = Academic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academic_params
      params.require(:academic).permit(:academic_training, :status, :start_data, :finish_data, :establishment, :discipline, :description, :employee_id, document_academics_attributes: [:id, :academics_id, :document, :commentary, :_destroy])
    end
end
