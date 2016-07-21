json.array!(@biopsias_forms) do |biopsias_form|
  json.extract! biopsias_form, :id, :paciente_id, :hospital_id, :servicio, :medico_solicitante, :diag_clinico, :datos_anatom, :datos_import, :macroscopico, :microscopico, :diagnostico, :dr, :patologo
  json.url biopsias_form_url(biopsias_form, format: :json)
end
