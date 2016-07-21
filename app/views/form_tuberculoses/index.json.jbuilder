json.array!(@form_tuberculoses) do |form_tuberculose|
  json.extract! form_tuberculose, :id, :paciente_id, :hospital_id
  json.url form_tuberculose_url(form_tuberculose, format: :json)
end
