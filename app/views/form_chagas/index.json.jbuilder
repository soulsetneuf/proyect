json.array!(@form_chagas) do |form_chaga|
  json.extract! form_chaga, :id, :paciente_id, :hospital_id, :cod_form_chagas, :muestra, :diag_serologico, :conclucion_diag, :diag_confir, :conclu_pueb_confir, :observaciones, :firma
  json.url form_chaga_url(form_chaga, format: :json)
end
