json.array!(@comunidads) do |comunidad|
  json.extract! comunidad, :id, :nombre
  json.url comunidad_url(comunidad, format: :json)
end
