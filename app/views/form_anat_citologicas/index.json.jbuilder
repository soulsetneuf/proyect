json.array!(@form_anat_citologicas) do |form_anat_citologica|
  json.extract! form_anat_citologica, :id, :paciente_id, :hospital_id, :servicio, :cama, :diagnostico_clinico, :datos_anatomicos, :lugar_muestra, :diagnostico_operatorio, :pieza_quirurgica, :biopsia, :otros, :conservante, :fecha_entrega, :hospital_id
  json.url form_anat_citologica_url(form_anat_citologica, format: :json)
end
