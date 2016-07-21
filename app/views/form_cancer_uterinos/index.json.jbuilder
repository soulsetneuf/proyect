json.array!(@form_cancer_uterinos) do |form_cancer_uterino|
  json.extract! form_cancer_uterino, :id, :paciente_id, :hospital_id, :fecha_ult_menstruacion, :fecha_ult_parto, :fecha_aborto, :nivel_social, :n_emabarazos, :nro, :sin_tratamiento, :n_abortos, :ritmo, :dia_termo, :n_cesareas, :estado_lactancia, :menopausia, :embarazo, :ligadura_trompas, :oral, :depo, :otros, :criocirug_hormonal, :aspecto_cuello, :flujo_vaginal, :lugar_de_muestra, :informacion_toma_muestra, :control, :fecha_entrega
  json.url form_cancer_uterino_url(form_cancer_uterino, format: :json)
end
