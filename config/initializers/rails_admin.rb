RailsAdmin.config do |config|
  require 'i18n'
  I18n.default_locale = :en
  ### Set the application name
  #config.main_app_name = ["Sicof", "BackOffice"]
  config.main_app_name = Proc.new { |controller| [ "SIGAP", "BackOffice - #{controller.params[:action].try(:titleize)}" ] }
  
  config.parent_controller = 'ApplicationController'
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    #show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  # Modelos incluidos
  #config.excluded_models << "Employee"
  #config.excluded_models << "FamilyGroup"
  config.included_models = ["User", "City", "State", "Country", "GeneralDirection", "Direction", "Department", "Function"]

  # Customize models
  config.model 'User' do
    navigation_icon 'icon-user'
    label 'Usuario'
    # Listado
    list do
      items_per_page 30
      field :avatar do
        label "Avatar"
      end
      field :first_name do
        label "Nombre"
      end
      field :last_name do
        label "Apellido"
      end
      field :permission_level do
        label "Permisos"
      end
      field :status do
        label "Activo/Inactivo"
      end
      field :role do
        label "Rol"
      end
    end
    # Panel de edición
    edit do
      field :first_name do
        label "Nombre"
      end
      field :last_name do
        label "Apellido"
      end
      field :permission_level do
        label "Permisos dentro de sistema"
      end
      field :avatar do
        label "Avatar"
      end
      field :status do
        label "Estado (Activo/Inactivo)"
      end
      field :role do
        label "Rol"
      end
    end
    # Panel de vista
    show do
      field :first_name do
        label "Nombre"
      end
      field :last_name do
        label "Apellido"
      end
      field :permission_level do
        label "Permisos dentro de sistema"
      end
      field :avatar do
        label "Avatar"
      end
      field :status do
        label "Estado (Activo/Inactivo)"
      end
      field :role do
        label "Rol"
      end
    end
    create do
      field :email do
        label "Correo Electrónico"
      end
      field :first_name do
        label "Nombre"
      end
      field :last_name do
        label "Apellido"
      end
      field :password do
        label "Contraseña"
      end
      field :password_confirmation do
        label "Vuelva a escribir la contraseña"
      end
    end
  end

  config.model 'City' do
    navigation_label 'Ubicación'
    label 'Ciudad'
    label_plural 'Ciudades'
    weight 2
  end

  config.model 'State' do
    navigation_label 'Ubicación'
    label 'Provincia'
    label_plural 'Provincias'
    weight 1
  end

  config.model 'Country' do
    navigation_label 'Ubicación'
    label 'País'
    label_plural 'Paises'
    weight 0
  end

  config.model 'GeneralDirection' do
    navigation_label 'Segregación de Funciones'
    label 'Dirección General'
    label_plural 'Dirección General'
    weight 0
    # panel de edición
      edit do
        field :name do
          label "Nombre"
        end
      end
  end

  config.model 'Direction' do
    navigation_label 'Segregación de Funciones'
    label 'Dirección'
    label_plural 'Dirección'
    weight 1
  end

  config.model 'Department' do
    navigation_label 'Segregación de Funciones'
    label 'Departamento'
    label_plural 'Departamento'
    weight 2
  end

  config.model 'Function' do
    navigation_label 'Segregación de Funciones'
    label 'Función'
    label_plural 'Función'
    weight 3
  end

  


end
