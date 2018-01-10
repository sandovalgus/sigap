class HomeController < ApplicationController
	before_action :authenticate_user!
	respond_to  :html, :json

    
	def index

		#limpieza profunda de galletitas
		if cookies[:employee_id].present?
			cookies.delete :employee_id
		end
		@search = Employee.left_outer_joins(:clinical, :family_groups, :academics)
					.includes(:labors)
					.order('legajo DESC')
					.search(params[:q])
		puts "**********************************"
		puts @search.inspect
		@@pepe = @search # -> Ver por pepe en método 'listpdf'
		@employee = @search.result(distinct: true)
		@employee = @employee.page(params[:page]).per(10)
		@labors = Labor.joins(:general_direction, :direction, :department, :function, :employee)
					.order(departure_date: :asc)
					.all

		#CANTIDAD de contratos por vencer
		@count = expired_counts(@labors)			
					
		if params[:q].present?
			cookies[:regimen] =  params["q"]["regimen_start"]
			cookies[:category] =  params["q"]["category_start"]
			cookies[:manyinputs] =  params["q"]["last_name_or_name_or_legajo_or_email_cont_any"]
		end

		# Hijos próximos a cumplir la mayoria de edad
		@family_groups = FamilyGroup.left_outer_joins(:employee).where(family_ties: "HIJO/A").distinct
		@full_age ||= Array.new
		@family_groups.each do |f|
			if f.Birthday.present?
				if age_calculate(f.Birthday) == 17 #Ver que otra bandera se puede usar para Hijos que ya hayan cumplido la mayoria de edad.
					if (expires_in = calculate_days(f.Birthday, 31)) != nil #Cantidad de dias que faltan para cumplir 18
						@full_age << f
					end
				end
			end
		end

      respond_to do |format|
        format.html
        format.js
      end

	end

	def show
	end

	def listpdf
		if (cookies[:regimen].present? || cookies[:category].present?  || cookies[:manyinputs].present? )
			@employee = @@pepe.result(distinct: true)
		else
			@employee = Employee.all
		end
			respond_to do |format|
				format.html
				format.pdf do 
					render :pdf         => "file_name",
					:layout=>  'pdf.html', 
					:page_size => 'A4',
					:dpi=>'72',
					title: 'Listado empleados', 
					:margin => {:top => 26, :bottom =>21 },
					:header => {
					:content => render_to_string(:template => 'pdf-component/header.pdf.erb')
					},
					:footer => {
					:content => render_to_string(:template => 'pdf-component/footer.pdf.erb')
					 }
				end
			end
	end

  def employee_params
    params.require(:employee).permit(:legajo, :name, :last_name, :cuil, :document_type, :document_number, :birthday, :marital_state, :avatar, :email, :tel_cel, :tel_home, :other_tel)
  end
end
