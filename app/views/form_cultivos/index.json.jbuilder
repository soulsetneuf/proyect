json.array!(@form_cultivos) do |form_cultivo|
  json.extract! form_cultivo, :id, :paciente_id, :hospital_id, :fecha, :tipo_muestra, :medico, :periodo, :observaciones
  json.url form_cultivo_url(form_cultivo, format: :json)
end
