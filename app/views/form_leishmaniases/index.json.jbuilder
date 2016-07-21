json.array!(@form_leishmaniases) do |form_leishmaniase|
  json.extract! form_leishmaniase, :id, :paciente_id, :hospital_id, :lug_prob_infeccion, :tipo_lesion, :ubicacion_lesion, :tiempo_evol_lesion, :n_muestras_tom, :post_tratam, :epd, :idrm, :cultivo, :pcr, :otro, :medico_solicitante, :firma
  json.url form_leishmaniase_url(form_leishmaniase, format: :json)
end
