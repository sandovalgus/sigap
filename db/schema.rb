# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171124132525) do

  create_table "academics", force: :cascade do |t|
    t.string   "academic_training"
    t.string   "status"
    t.date     "start_data"
    t.date     "finish_data"
    t.string   "establishment"
    t.string   "discipline"
    t.string   "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "employee_id"
    t.index ["employee_id"], name: "index_academics_on_employee_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "neighborhood"
    t.string   "address_street"
    t.string   "address_number"
    t.string   "address_floor"
    t.string   "address_floor_apartment_number"
    t.string   "address_monoblock"
    t.integer  "employee_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "city_id"
    t.boolean  "actual",                         default: true
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["employee_id"], name: "index_addresses_on_employee_id"
  end

  create_table "attachment_files", force: :cascade do |t|
    t.string   "name"
    t.string   "commentary"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "document"
    t.index ["imageable_type", "imageable_id"], name: "index_attachment_files_on_imageable_type_and_imageable_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "clinicals", force: :cascade do |t|
    t.string   "tel_emergency"
    t.string   "name_contact"
    t.string   "name_social_work"
    t.string   "number_partner"
    t.string   "blood_type"
    t.string   "allergies"
    t.string   "background"
    t.boolean  "clinical_analyzes"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "employee_id"
    t.string   "lugar"
    t.date     "fecha"
    t.string   "apellido"
    t.string   "nombre"
    t.string   "clase"
    t.string   "edad"
    t.string   "dni"
    t.string   "nacionalidad"
    t.string   "estado_civil"
    t.string   "tarea_designado"
    t.string   "categoria"
    t.string   "peso"
    t.string   "estatura"
    t.string   "pulso"
    t.string   "temperatura"
    t.string   "presion_arterial_max"
    t.string   "presion_arterial_min"
    t.string   "antec_heriditarios_personales"
    t.string   "estado_gral_morfologia_nutricion"
    t.string   "sistema_oseo_art_muscular"
    t.string   "aparato_respiratorio"
    t.string   "tos"
    t.string   "expectoracion"
    t.string   "disnea"
    t.string   "fuma"
    t.string   "cuanto_fuma"
    t.string   "roncus"
    t.string   "sibilancia"
    t.string   "estertores"
    t.string   "aparato_digestivo_anexos"
    t.string   "intervenciones_quirurgias"
    t.string   "aparato_urinario_genital"
    t.string   "ciclo_menstruales"
    t.string   "aparato_circulatorio_frec_cardiaca"
    t.string   "aparato_circulatorio_varices"
    t.string   "sistema_nervioso"
    t.string   "examen_oftalmologico"
    t.string   "examen_otorrinolaringologico"
    t.string   "examen_pel"
    t.string   "radiografia_torax_abreugrafia"
    t.string   "analisis_orina"
    t.string   "vdrl"
    t.string   "chagas"
    t.string   "toxo"
    t.string   "parasitologia"
    t.string   "glucemia"
    t.string   "uremia"
    t.string   "uricemia"
    t.string   "hamograma"
    t.string   "eritrosodimentacion"
    t.string   "colesteromia"
    t.string   "otros"
    t.string   "otros_examenes"
    t.string   "conclusion"
    t.string   "conclusion_final"
    t.string   "profesional_actuante"
    t.index ["employee_id"], name: "index_clinicals_on_employee_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "direction_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "general_direction_id"
    t.index ["direction_id"], name: "index_departments_on_direction_id"
    t.index ["general_direction_id"], name: "index_departments_on_general_direction_id"
  end

  create_table "directions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "general_direction_id"
    t.index ["general_direction_id"], name: "index_directions_on_general_direction_id"
  end

  create_table "document_academics", force: :cascade do |t|
    t.string   "document"
    t.string   "commentary"
    t.integer  "academic_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["academic_id"], name: "index_document_academics_on_academic_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "legajo"
    t.string   "name"
    t.string   "last_name"
    t.string   "cuil"
    t.string   "document_type"
    t.string   "document_number"
    t.datetime "birthday"
    t.string   "marital_state"
    t.string   "avatar"
    t.boolean  "active"
    t.string   "email"
    t.string   "tel_cel"
    t.string   "tel_home"
    t.string   "other_tel"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "lock_version",      default: "unlocked", null: false
    t.string   "nationality"
    t.datetime "date_of_admission"
  end

  create_table "family_groups", force: :cascade do |t|
    t.string   "family_ties"
    t.string   "name"
    t.string   "last_name"
    t.string   "document_numbre"
    t.string   "cuil"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "employee_id"
    t.datetime "Birthday"
    t.boolean  "live",            default: true
    t.index ["employee_id"], name: "index_family_groups_on_employee_id"
  end

  create_table "functions", force: :cascade do |t|
    t.string   "name"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_functions_on_department_id"
  end

  create_table "general_directions", force: :cascade do |t|
    t.integer  "direction_id"
    t.integer  "department_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_general_directions_on_department_id"
    t.index ["direction_id"], name: "index_general_directions_on_direction_id"
  end

  create_table "labor_functions", force: :cascade do |t|
    t.integer  "labor_id"
    t.integer  "function_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["function_id"], name: "index_labor_functions_on_function_id"
    t.index ["labor_id"], name: "index_labor_functions_on_labor_id"
  end

  create_table "labors", force: :cascade do |t|
    t.integer  "employee_id"
    t.date     "entry_date"
    t.date     "departure_date"
    t.string   "status"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "function_id"
    t.boolean  "permanent_plant_pass"
    t.boolean  "adscribed"
    t.boolean  "departure_date_indefinite"
    t.string   "takeover"
    t.datetime "takeover_date"
    t.string   "contracting_regime"
    t.string   "legal_instrument"
    t.integer  "category"
    t.string   "adscribed_organization_name"
    t.index ["employee_id"], name: "index_labors_on_employee_id"
    t.index ["function_id"], name: "index_labors_on_function_id"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "permission_level",       default: 0
    t.string   "avatar"
    t.boolean  "status",                 default: true
    t.string   "role",                   default: "none"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 1073741823
    t.datetime "created_at"
    t.text     "object_changes", limit: 1073741823
    t.integer  "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

end
