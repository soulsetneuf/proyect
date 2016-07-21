# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160514144537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "baciloscopia_forms", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "hospital_id"
    t.date     "fecha"
    t.string   "tipo_muestra"
    t.string   "razon_solicitud"
    t.string   "l_j"
    t.string   "s_t"
    t.date     "periodo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "baciloscopia_forms", ["hospital_id"], name: "index_baciloscopia_forms_on_hospital_id", using: :btree
  add_index "baciloscopia_forms", ["paciente_id"], name: "index_baciloscopia_forms_on_paciente_id", using: :btree

  create_table "biopsias_forms", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "hospital_id"
    t.string   "servicio"
    t.string   "medico_solicitante"
    t.string   "diag_clinico"
    t.string   "datos_anatom"
    t.string   "datos_import"
    t.text     "macroscopico"
    t.text     "microscopico"
    t.text     "diagnostico"
    t.string   "dr"
    t.string   "patologo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "biopsias_forms", ["hospital_id"], name: "index_biopsias_forms_on_hospital_id", using: :btree
  add_index "biopsias_forms", ["paciente_id"], name: "index_biopsias_forms_on_paciente_id", using: :btree

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comunidads", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diagnosticos", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "n_diagnostico"
    t.string   "despcripcion"
    t.string   "tipo_diagnostico"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diagnosticos", ["paciente_id"], name: "index_diagnosticos_on_paciente_id", using: :btree

  create_table "distritos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "establecimientos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_anat_citologicas", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "hospital_id"
    t.string   "servicio"
    t.string   "cama"
    t.text     "diagnostico_clinico"
    t.text     "datos_anatomicos"
    t.string   "lugar_muestra"
    t.text     "diagnostico_operatorio"
    t.string   "pieza_quirurgica"
    t.string   "biopsia"
    t.string   "otros"
    t.string   "conservante"
    t.date     "fecha_entrega"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_anat_citologicas", ["hospital_id"], name: "index_form_anat_citologicas_on_hospital_id", using: :btree
  add_index "form_anat_citologicas", ["paciente_id"], name: "index_form_anat_citologicas_on_paciente_id", using: :btree

  create_table "form_baciloscopia", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "hospital_id"
    t.date     "fecha"
    t.string   "tipo_muestra"
    t.string   "razon_solicitud"
    t.string   "l_j"
    t.string   "s_t"
    t.date     "periodo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_baciloscopia", ["hospital_id"], name: "index_form_baciloscopia_on_hospital_id", using: :btree
  add_index "form_baciloscopia", ["paciente_id"], name: "index_form_baciloscopia_on_paciente_id", using: :btree

  create_table "form_cancer_uterinos", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "hospital_id"
    t.date     "fecha_ult_menstruacion"
    t.date     "fecha_ult_parto"
    t.date     "fecha_aborto"
    t.integer  "nivel_social"
    t.integer  "n_emabarazos"
    t.integer  "n_abortos"
    t.integer  "n_cesareas"
    t.boolean  "estado_lactancia"
    t.boolean  "menopausia"
    t.boolean  "embarazo"
    t.string   "flujo_vaginal"
    t.string   "lugar_de_muestra"
    t.text     "informacion_toma_muestra"
    t.boolean  "control"
    t.datetime "fecha_entrega"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "edad_menarquia"
    t.string   "aspecto_cuello"
    t.string   "planificacion_familiar"
    t.string   "tratamiento"
    t.integer  "distrito_id"
  end

  add_index "form_cancer_uterinos", ["distrito_id"], name: "index_form_cancer_uterinos_on_distrito_id", using: :btree
  add_index "form_cancer_uterinos", ["hospital_id"], name: "index_form_cancer_uterinos_on_hospital_id", using: :btree
  add_index "form_cancer_uterinos", ["paciente_id"], name: "index_form_cancer_uterinos_on_paciente_id", using: :btree

  create_table "form_chagas", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "hospital_id"
    t.string   "muestra"
    t.string   "diag_serologico"
    t.string   "conclucion_diag"
    t.string   "diag_confir"
    t.string   "conclu_pueb_confir"
    t.text     "observaciones"
    t.string   "firma"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_chagas", ["hospital_id"], name: "index_form_chagas_on_hospital_id", using: :btree
  add_index "form_chagas", ["paciente_id"], name: "index_form_chagas_on_paciente_id", using: :btree

  create_table "form_cultivos", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "hospital_id"
    t.date     "fecha"
    t.string   "tipo_muestra"
    t.string   "medico"
    t.date     "periodo"
    t.text     "observaciones"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_cultivos", ["hospital_id"], name: "index_form_cultivos_on_hospital_id", using: :btree
  add_index "form_cultivos", ["paciente_id"], name: "index_form_cultivos_on_paciente_id", using: :btree

  create_table "form_laboratorios", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "usuario_id"
    t.integer  "hospital_id"
    t.datetime "fecha_toma_muestra"
    t.datetime "fecha_entrega"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
  end

  add_index "form_laboratorios", ["hospital_id"], name: "index_form_laboratorios_on_hospital_id", using: :btree
  add_index "form_laboratorios", ["paciente_id"], name: "index_form_laboratorios_on_paciente_id", using: :btree
  add_index "form_laboratorios", ["usuario_id"], name: "index_form_laboratorios_on_usuario_id", using: :btree

  create_table "form_leishmaniases", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "hospital_id"
    t.string   "lug_prob_infeccion"
    t.string   "tipo_lesion"
    t.string   "ubicacion_lesion"
    t.string   "tiempo_evol_lesion"
    t.string   "n_muestras_tom"
    t.string   "post_tratam"
    t.string   "epd"
    t.string   "idrm"
    t.string   "cultivo"
    t.string   "pcr"
    t.string   "otro"
    t.string   "medico_solicitante"
    t.string   "firma"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_leishmaniases", ["hospital_id"], name: "index_form_leishmaniases_on_hospital_id", using: :btree
  add_index "form_leishmaniases", ["paciente_id"], name: "index_form_leishmaniases_on_paciente_id", using: :btree

  create_table "form_liquidos", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "hospital_id"
    t.string   "servicio"
    t.string   "medico_solicitante"
    t.string   "diag_clinico"
    t.string   "datos_impot"
    t.string   "fun"
    t.string   "fup"
    t.string   "hormonoterapia"
    t.string   "radioterapia"
    t.text     "conclusion"
    t.string   "dr"
    t.string   "citologo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_liquidos", ["hospital_id"], name: "index_form_liquidos_on_hospital_id", using: :btree
  add_index "form_liquidos", ["paciente_id"], name: "index_form_liquidos_on_paciente_id", using: :btree

  create_table "form_malaria", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "hospital_id"
    t.string   "tiene_malar_trat_antimalarico"
    t.string   "diagnostico"
    t.string   "tratami"
    t.string   "compl_trat"
    t.string   "lugar_tratado"
    t.string   "lug_hace_sema"
    t.string   "ocupacion"
    t.string   "tipo_caso"
    t.string   "inicio_sint"
    t.string   "tipo"
    t.string   "prueba"
    t.string   "resultado"
    t.string   "densidad_paras"
    t.string   "peso"
    t.string   "trat_superv"
    t.string   "req_trat_mal_grave"
    t.string   "persis_sintom"
    t.date     "fecha_control"
    t.string   "firma"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_malaria", ["hospital_id"], name: "index_form_malaria_on_hospital_id", using: :btree
  add_index "form_malaria", ["paciente_id"], name: "index_form_malaria_on_paciente_id", using: :btree

  create_table "form_tuberculoses", force: true do |t|
    t.integer  "paciente_id"
    t.integer  "hospital_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_tuberculoses", ["hospital_id"], name: "index_form_tuberculoses_on_hospital_id", using: :btree
  add_index "form_tuberculoses", ["paciente_id"], name: "index_form_tuberculoses_on_paciente_id", using: :btree

  create_table "hospitals", force: true do |t|
    t.string   "nombre"
    t.string   "sigla"
    t.string   "provincia"
    t.string   "ciudad"
    t.string   "direccion"
    t.string   "logo"
    t.string   "distrito"
    t.string   "establecimiento"
    t.string   "centro_salud"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insumo_reactivos", force: true do |t|
    t.integer  "form_laboratorio_id"
    t.string   "tipo"
    t.string   "nombre"
    t.string   "unidad_medida"
    t.float    "cantidad"
    t.float    "costo_unitario"
    t.float    "costo_total"
    t.string   "partida"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "insumo_reactivos", ["form_laboratorio_id"], name: "index_insumo_reactivos_on_form_laboratorio_id", using: :btree

  create_table "inventarios", force: true do |t|
    t.integer  "insumo_reactivo_id"
    t.integer  "form_laboratorio_id"
    t.integer  "hospital_id"
    t.string   "nombre"
    t.float    "stock"
    t.text     "detalle"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inventarios", ["form_laboratorio_id"], name: "index_inventarios_on_form_laboratorio_id", using: :btree
  add_index "inventarios", ["hospital_id"], name: "index_inventarios_on_hospital_id", using: :btree
  add_index "inventarios", ["insumo_reactivo_id"], name: "index_inventarios_on_insumo_reactivo_id", using: :btree

  create_table "kardexes", force: true do |t|
    t.integer  "insumo_reactivo_id"
    t.date     "fecha"
    t.float    "reg_entrada"
    t.float    "reg_salida"
    t.float    "saldo"
    t.string   "recibido_entregado"
    t.text     "observaciones"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kardexes", ["insumo_reactivo_id"], name: "index_kardexes_on_insumo_reactivo_id", using: :btree

  create_table "laboratorios", force: true do |t|
    t.integer  "persona_id"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "laboratorios", ["persona_id"], name: "index_laboratorios_on_persona_id", using: :btree

  create_table "line_items", force: true do |t|
    t.integer  "insumo_reactivo_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",           default: 1
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["insumo_reactivo_id"], name: "index_line_items_on_insumo_reactivo_id", using: :btree

  create_table "municipios", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacientes", force: true do |t|
    t.integer  "form_laboratorio_id"
    t.string   "nombres"
    t.string   "apellidos"
    t.date     "fecha_nacimiento"
    t.string   "sexo"
    t.string   "direccion"
    t.string   "ciudad"
    t.integer  "telefono"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tipo"
  end

  add_index "pacientes", ["form_laboratorio_id"], name: "index_pacientes_on_form_laboratorio_id", using: :btree

  create_table "personas", force: true do |t|
    t.integer  "ci"
    t.string   "nombre"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "direccion"
    t.string   "telefono"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provincia", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registro_insumos_reactivos", force: true do |t|
    t.string   "estado"
    t.integer  "insumo_reactivo_id"
    t.float    "cantidad"
    t.string   "personal_entregante"
    t.string   "pesonal_receptor"
    t.text     "observaciones"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "form_laboratorio_id"
  end

  add_index "registro_insumos_reactivos", ["form_laboratorio_id"], name: "index_registro_insumos_reactivos_on_form_laboratorio_id", using: :btree
  add_index "registro_insumos_reactivos", ["insumo_reactivo_id"], name: "index_registro_insumos_reactivos_on_insumo_reactivo_id", using: :btree

  create_table "rols", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tuberculosis", force: true do |t|
    t.integer  "form_laboratorio_id"
    t.integer  "paciente_id"
    t.string   "tipo_de_muestra"
    t.string   "razon"
    t.string   "medico"
    t.string   "centro_de_salud"
    t.text     "observaciones"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tuberculosis", ["form_laboratorio_id"], name: "index_tuberculosis_on_form_laboratorio_id", using: :btree
  add_index "tuberculosis", ["paciente_id"], name: "index_tuberculosis_on_paciente_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rol_id"
    t.integer  "ci"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["rol_id"], name: "index_users_on_rol_id", using: :btree

end
