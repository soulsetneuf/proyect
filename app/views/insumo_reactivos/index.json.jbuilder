json.array!(@insumo_reactivos) do |insumo_reactivo|
  json.extract! insumo_reactivo, :id, :form_laboratorio_id, :tipo, :nombre, :unidad_medida, :cantidad, :costo_unitario, :costo_total, :partida, :descripcion
  json.url insumo_reactivo_url(insumo_reactivo, format: :json)
end
