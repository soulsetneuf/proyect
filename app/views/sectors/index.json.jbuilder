json.array!(@sectors) do |sector|
  json.extract! sector, :id, :nombre
  json.url sector_url(sector, format: :json)
end
