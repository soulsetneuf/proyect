json.array!(@inventarios) do |inventario|
  json.extract! inventario, :id, :insumo_reactivo_id, :form_laboratorio_id, :hospital_id, :nombre, :stock, :detalle, :tipo
  json.url inventario_url(inventario, format: :json)
end
