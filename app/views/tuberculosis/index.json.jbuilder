json.array!(@tuberculosis) do |tuberculosi|
  json.extract! tuberculosi, :id, :form_laboratorio_id, :paciente_id, :tipo_de_muestra, :razon, :medico, :centro_de_salud, :observaciones
  json.url tuberculosi_url(tuberculosi, format: :json)
end
