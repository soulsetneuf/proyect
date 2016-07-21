json.array!(@registro_insumos_reactivos) do |registro_insumos_reactivo|
  json.extract! registro_insumos_reactivo, :id, :estado, :insumo_reactivo_id, :cantidad, :personal_entregante, :pesonal_receptor, :observaciones
  json.url registro_insumos_reactivo_url(registro_insumos_reactivo, format: :json)
end
