json.array!(@form_liquidos) do |form_liquido|
  json.extract! form_liquido, :id, :paciente_id, :hospital_id, :servicio, :medico_solicitante, :diag_clinico, :datos_impot, :fun, :fup, :hormonoterapia, :radioterapia, :conclusion, :dr, :citologo
  json.url form_liquido_url(form_liquido, format: :json)
end
