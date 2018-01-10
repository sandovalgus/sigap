class FamilyGroupsController < ApplicationController
  before_action :set_family_group, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  respond_to :html, :json
  helper_method :get_age

  def index
    @family_group = FamilyGroup.new
    #Si se ingresa al #index#FamilyGroup desde un empleado, entonces cookies[:employee_id] != nil
    if cookies[:employee_id].present?
      @employee = Employee.find(cookies[:employee_id])
      @family_groups = FamilyGroup.where(employee_id: cookies[:employee_id]).all
    else #Si se ingresa desde el #root, cookies[:employee_id] == nil y params[:employee_id] sera el que tenga el id de empleado
      if params[:employee_id].present?
        cookies[:employee_id] = params[:employee_id]
        @employee = Employee.find(params[:employee_id])
        @family_groups = FamilyGroup.where(employee_id: params[:employee_id]).all
      end
    end
  end

  def get_age(birthday)
    return age_calculate(birthday)
  end


  def download
    puts "----------------- download ----------------"
    @attachment_file = AttachmentFile.find(params[:id])
    
    send_file(@attachment_file.document.path,
      :disposition => 'attachment',
      :url_based_filename => false)            
  end

  def show
    if params[:object].present?
      @family_group = FamilyGroup.where(id: params[:object]).first
      puts @family_group.inspect
    end
    respond_modal_with @family_group
  end

  def new
    has_relationship()
    @family_group = FamilyGroup.new
    respond_modal_with @family_group
  end

  #Verifica si existe una relacion 'family_ties' de tipo Conyuge o Concubino con un Empleado
  def has_relationship
    @query = FamilyGroup.where("employee_id= ? AND (family_ties= ? OR family_ties= ?)", cookies[:employee_id], "CONYUGE", "CONCUBINO")
  end

  # GET /family_groups/1/edit
  def edit
    puts @family_group.family_ties.inspect
    if @family_group.family_ties != "CONYUGE" && @family_group.family_ties != "CONCUBINO"
      @query = 0
      puts @query.inspect
    end
    respond_modal_with @family_group.attachment_files
  end

  def create
    @employee = Employee.find(cookies[:employee_id])
    @family_group = FamilyGroup.new(family_group_params)
    @family_group.employee_id = @employee.id
    if @family_group.save
      flash[:success] = 'Los datos familiares se guardaron exitosamente.'
      respond_modal_with @family_group, location: family_groups_path  
    end
  end

  def update
    # if has_relationship().present? #True si existe relación
    #   flash[:warning] = 'Error. ¡Ya existe este tipo de familiar para este empleado!'
    #   respond_modal_with @family_group, location: family_groups_path  
    # else
      respond_to do |format|
        if @family_group.update(family_group_params)
           flash[:notice] ='Se actualizó el Familiar.' 
          format.html { redirect_to family_groups_path }
          format.json { render :index, status: :ok, location: @family_group }
        else
          format.html { render :edit }
          format.json { render json: @family_group.errors, status: :unprocessable_entity }
        end
      end
    #end
  end

  def destroy
    @family_group.destroy
    respond_to do |format|
       flash[:warning] ='El dato familiar ha sido eliminado.'
      format.html { redirect_to family_groups_url}
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_group
      @family_group = FamilyGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_group_params
      params.require(:family_group).permit(:family_ties, :Birthday, :age, :name, :last_name, :document_numbre, :live, :employee_id, attachment_files_attributes: [:id, :name, :document, :document_cache, :commentary, :_destroy])
    end
end
