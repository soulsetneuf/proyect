json.array!(@pacientes) do |paciente|
  json.extract! paciente, :id, :form_laboratorio_id, :nombres, :apellidos, :fecha_nacimiento, :edad, :sexo, :direccion, :ciudad, :telefono
  json.url paciente_url(paciente, format: :json)
end
