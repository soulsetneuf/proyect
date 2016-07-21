json.array!(@personas) do |persona|
  json.extract! persona, :id, :ci, :nombre, :apellido_paterno, :apellido_materno, :direccion, :telefono
  json.url persona_url(persona, format: :json)
end
