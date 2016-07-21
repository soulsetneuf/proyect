json.array!(@laboratorios) do |laboratorio|
  json.extract! laboratorio, :id, :persona_id, :nombre
  json.url laboratorio_url(laboratorio, format: :json)
end
