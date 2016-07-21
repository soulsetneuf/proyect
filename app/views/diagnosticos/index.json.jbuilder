json.array!(@diagnosticos) do |diagnostico|
  json.extract! diagnostico, :id, :paciente_id, :n_diagnostico, :despcripcion, :tipo_diagnostico
  json.url diagnostico_url(diagnostico, format: :json)
end
