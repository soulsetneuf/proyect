json.array!(@provincia) do |provincium|
  json.extract! provincium, :id, :nombre
  json.url provincium_url(provincium, format: :json)
end
