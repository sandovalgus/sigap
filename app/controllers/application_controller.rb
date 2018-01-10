class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #Controla el inicio de sesión
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :set_paper_trail_whodunnit
  rescue_from CanCan::AccessDenied do |exception|
    #redirect_to root_path, :alert => exception.message
    flash[:alert] = "¡No tienes los permisos para entrar a esta sección! :'("
    redirect_to root_path
  end


  def authenticate_admin_user!
    #authenticate_user!
    #unless current_user.role?(:admin) || current_user.role?(:none)
    unless current_user.role?(:admin)
      flash[:alert] = "¡No tienes los permisos para entrar a esta sección! :'("
      redirect_to root_path
    end
  end

  # Ventanas modal
  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

  # Cálculo de edad
  def age_calculate(birthday)
    now = Time.now.utc.to_date
    age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
    return age
  end

  # ¿Cuántos dias faltan?
  # Paramentros: Fecha, Minimo de dias.
  def calculate_days(start_date, minimum)
    if start_date.past?
      now = Time.now.utc.to_date
      start_date = start_date.to_date
      anio = now.year + ((start_date.month > now.month || (start_date.month == now.month && start_date.day >= now.day)) ? 0 : 1)
      # puts "*******************++++++++++++++++********"
      # puts start_date
      # puts now
      start_date = start_date.change(year: anio)
      expires_in = (start_date.to_date - now.to_date).to_i
      # puts "*******************++++++++++++++++********"
      # puts expires_in
      #return expires_in if expires_in <= minimum
      if expires_in <= minimum
        return expires_in
      else
        return nil
      end
    end
  end

  #Cantidad de contratos a vencer
  def expired_counts(labors) 
    count ||= 0
    labors.each do |l|
      if l.departure_date.present? && l.departure_date.future?
        expired = ((l.departure_date).to_date - (Time.now.to_s).to_date).to_i
        if expired.present? && expired <= 31
          count+=1
        end
      end
    end
    return count
  end

  protected
  	def configure_permitted_parameters
  		# devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
  		devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:first_name, :last_name, :email, :password, :avatar, :permission_level)}
  		devise_parameter_sanitizer.permit(:account_update){ |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :avatar, :permission_level)}
  	end
    #Permisos de usuario
    #def authenticate_normal!
    #  redirect_to root_path unless user_signed_in? && current_user.is_normal_user?
    #end
    #def authenticate_admin!
    #  redirect_to root_path unless user_signed_in? && current_user.is_admin_user?
    #end
    #def authenticate_super!
    #  redirect_to root_path unless user_signed_in? && current_user.is_super_user?
    #end
end