json.array!(@establecimientos) do |establecimiento|
  json.extract! establecimiento, :id, :nombre
  json.url establecimiento_url(establecimiento, format: :json)
end
