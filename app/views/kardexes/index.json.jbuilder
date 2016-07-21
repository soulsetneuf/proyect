json.array!(@kardexes) do |kardex|
  json.extract! kardex, :id, :insumo_reactivo_id, :fecha, :reg_entrada, :reg_salida, :saldo, :recibido_entregado, :observaciones
  json.url kardex_url(kardex, format: :json)
end
