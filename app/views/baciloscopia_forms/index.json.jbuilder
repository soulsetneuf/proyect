json.array!(@baciloscopia_forms) do |baciloscopia_form|
  json.extract! baciloscopia_form, :id, :paciente_id, :hospital_id, :fecha, :tipo_muestra, :razon_solicitud, :l_j, :s_t, :periodo
  json.url baciloscopia_form_url(baciloscopia_form, format: :json)
end
