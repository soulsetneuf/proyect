json.array!(@form_malaria) do |form_malarium|
  json.extract! form_malarium, :id, :paciente_id, :hospital_id, :tiene_malar_trat_antimalarico, :diagnostico, :tratami, :compl_trat, :lugar_tratado, :lug_hace_sema, :ocupacion, :tipo_caso, :inicio_sint, :tipo, :prueba, :resultado, :densidad_paras, :peso, :trat_superv, :req_trat_mal_grave, :persis_sintom, :fecha_control, :firma
  json.url form_malarium_url(form_malarium, format: :json)
end
