class ClinicalsController < ApplicationController
  before_action :set_clinical, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  respond_to :html, :json

  def index
    if params[:ids]
      @employee = Employee.find(params[:ids])
      cookies[:employee_id] = params[:ids]
    else
      @employee = Employee.find(cookies[:employee_id])
    end
    @clinical = Clinical.where(employee_id: cookies[:employee_id]).first

    if @employee.birthday.present?
      @edad = age_calculate(@employee.birthday)
    else
      @edad = ''
    end
  end

  def download
    @attachment_file = AttachmentFile.find(params[:id])
    send_file(@attachment_file.document.path,
      :disposition => 'attachment',
      :url_based_filename => false)
  end

  def new
    @clinical = Clinical.new
    employee_id = cookies[:employee_id]
    @employee = Employee.find(cookies[:employee_id])
    if @employee.birthday.present?
      @edad = age_calculate(@employee.birthday)
    else
      @edad = ''
    end
    respond_modal_with @clinical
  end
   # GET /employees/1/edit
  def edit
    employee_id = cookies[:employee_id]
    @employee = Employee.find(cookies[:employee_id])
    if @employee.birthday.present?
      @edad = age_calculate(@employee.birthday)
    else
      @edad = ''
    end
    respond_modal_with @clinical.attachment_files
  end

  def show

  end
  # POST /employees
  # POST /employees.json
   def create
   	@employee = Employee.find(cookies[:employee_id])
    @clinical = Clinical.new(clinical_params)
    @clinical.employee_id = @employee.id
    if @clinical.save
         flash[:success] = 'Los datos Clinicos se guardaron exitosamente.'
      respond_modal_with @clinical, location: clinicals_path
    end
  end

  def update
    respond_to do |format|
      if @clinical.update(clinical_params)
        flash[:notice] ='Se han actualizado los datos clinicos.' 
        format.html { redirect_to clinicals_path }
        format.json { render :index, status: :ok, location: @clinical }
      else
        format.html { render :edit }
        format.json { render json: @clinical.errors, status: :unprocessable_entity }
      end
    end
  end

    def destroy
    @clinical.destroy
    respond_to do |format|
       flash[:warning] ='Los datos clinicos se han eliminados.'
      format.html { redirect_to clinicals_path}
      # format.json { head :no_content }
      format.json { render :index, status: :ok, location: @clinical }
    end
  end

  private
  
      def set_clinical
      @clinical = Clinical.find(params[:id])
    end

    def clinical_params
      params.require(:clinical).permit(:tel_emergency, :name_contact, :name_social_work, 
        :number_partner, :blood_type, :allergies, :background, :clinical_analyzes, :employee_id,
        :lugar, :fecha, :apellido, :nombre, :clase, :edad, :dni, :nacionalidad, :estado_civil, :tarea_designado, 
        :categoria, :peso, :estatura, :pulso, :temperatura, :presion_arterial_max, :presion_arterial_min, :antec_heriditarios_personales,
        :estado_gral_morfologia_nutricion, :sistema_oseo_art_muscular,  :aparato_respiratorio, :tos, :expectoracion, :disnea,
        :fuma, :cuanto_fuma, :roncus, :sibilancia, :estertores, :aparato_digestivo_anexos, :intervenciones_quirurgias, 
        :aparato_urinario_genital, :ciclo_menstruales, :aparato_circulatorio_frec_cardiaca, :aparato_circulatorio_varices, 
       :sistema_nervioso,:examen_oftalmologico, :examen_otorrinolaringologico,  :examen_pel, :radiografia_torax_abreugrafia, :analisis_orina, :vdrl, :chagas, :toxo, :parasitologia,:glucemia, :uremia, :uricemia, :hamograma, :eritrosodimentacion, 
           :colesteromia, :otros, :otros_examenes, :conclusion, :conclusion_final, :profesional_actuante, attachment_files_attributes: [:id, :name, :document, :document_cache, :commentary, :_destroy])
    end
end

