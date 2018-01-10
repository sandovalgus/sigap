class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_normal!, except: [:destroy]
  #before_action :authenticate_admin!
  #before_action :authenticate_super!
  skip_before_action :verify_authenticity_token
  helper_method :get_age

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end
   
  def download   
    send_file @employee.copy_document,
    :filename => "#{File.extname(@employee.file.path)}"      
  end

  def get_age(birthday)
    return age_calculate(birthday)
  end

  def pdf
    @employee = Employee.left_outer_joins(:clinical, :labors, :family_groups , :academics).find(params[:id])
    if @employee.birthday.present?
      @edad = age_calculate(@employee.birthday)
    else
      @edad = ''
    end

    respond_to do |format|
      format.html
      format.pdf do 
        render  :pdf        => "file_name",
                :page_size  => 'A4',
                :dpi        =>'72',
                title: 'Ficha empleado del SiPTeD', 
                :margin     => {:top => 26, :bottom =>21 },
                :header     => {
                  :content  => render_to_string(:template => 'pdf-component/header.pdf.erb')
                },
                :footer     => {
                  :content  => render_to_string(:template => 'pdf-component/footer.pdf.erb')
                }
      end
    end
  end #end pdf

  def show
    cookies[:employee_id] = @employee.id

    # @employee = Employee.joins(:addresses, :city, :state, :country).where(employee_id: cookies[:employee_id]).order(id: :desc).all
    
    # @employee = Employee.joins(:address, :city, :state, :country).where(employee_id: cookies[:employee_id]).order(created_at: :asc).all
    # if @employee.state!= nil
    #   @provincia = State.where(id: @employee.State_id).first
    #   @provincia  = @provincia.name
    # end

    # if @employee.city_id  != nil 
    #   @ciudad = City.where(id: @employee.city_id).first
    #   @ciudad  = @ciudad.name
    # end

    if @employee.birthday.present?
      @edad = age_calculate(@employee.birthday)
    else
      @edad = ''
    end
    

    #Busca la relación de estado civil asociada al empleado
    t = Employee.includes(:family_groups).find(@employee.id)
    if t.present?
      res = t.family_groups.where('family_ties = ? OR family_ties = ?', 'CONYUGE', 'CONCUBINO')
      @civil_state_relationship = res.first
    else
      @civil_state_relationship = nil
    end

  end


  def new
    @employee = Employee.new
     # @employee.addresses.build.cities.build
  end
   
  def edit
    Employee.lock.find(@employee.id)
  end

  def create
    @employee = Employee.new(employee_params) 
    respond_to do |format|
      if @employee.save
        flash[:success] = 'Se ha dado de alta a ' + @employee.last_name + ', '+ @employee.name
        format.html { redirect_to @employee }
        format.json { render :show, status: :created, location: @employee }
      else        
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
        flash[:error] = 'Verifique los campos'
      end
    end
  end 

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        flash[:success] = 'Se a actuaizado los datos de ' + @employee.last_name + ', '+ @employee.name
        format.html { redirect_to @employee}
        format.json { render :show, status: :ok, location: @employee }
      else          
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
         flash[:notice] = 'Se ha eliminado correctamente'
        format.html { redirect_to employees_url}
        format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
       @employee = Employee.find(params[:id])
      
      # @employee = Employee.includes(family_groups: :document_families).find(params[:id])
          # @presupuesto = Budget.includes(budget_details: :product).find(cookies[:budget_id])
    end
    



    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:legajo, :date_of_admission, :nationality, :name, :last_name, :cuil, 
        :document_type, :document_number, :birthday,
        :marital_state, :avatar, :email, :tel_cel, :tel_home, 
         :other_tel, addresses_attributes: [:id, :employee_id, :neighborhood, :address_street, :address_number, 
         :address_floor, :address_floor_apartment_number, :address_monoblock, :city_id, :actual, :_destroy, cities_attributes:[:name] ],
         attachment_files_attributes: [:id, :name,  :document,:commentary, :document_cache, :_destroy]
           )
    end
end




 

