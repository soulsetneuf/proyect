json.array!(@form_laboratorios) do |form_laboratorio|
  json.extract! form_laboratorio, :id, :paciente_id, :usuario_id, :hospital_id, :fecha_toma_muestra, :fecha_entrega
  json.url form_laboratorio_url(form_laboratorio, format: :json)
end
