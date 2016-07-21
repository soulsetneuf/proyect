class FormMalarium < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :hospital

  validates :tiene_malar_trat_antimalarico, inclusion: {in: ['Si', 'No']}
  ANTECEDENTES =['Si', 'No']
  validates  :diagnostico,  inclusion: {in: ['Pv', 'Pf']}
  DIAGNOSTICO =['Pv', 'Pf']
  validates :tratami, inclusion: {in: ['Si', 'No']}
  TRATAMIENTO =['Si', 'No']
  validates :compl_trat, inclusion: {in:['Si', 'No'] }
  COMPLETO =['Si', 'No']
  validates  :lug_hace_sema, inclusion:{in:  ['Departamento', 'Municipio']}
  LUGAR=['Departamento', 'Municipio']
  validates :lugar_tratado,  inclusion: {in: ['País', 'Departamento','Municipio','Localidad/Comunidad','Barrio/Barraca/Rio']}
  LUGARPROBABLE =['País', 'Departamento','Municipio','Localidad/Comunidad','Barrio/Barraca/Rio']
  validates  :tipo_caso, inclusion:{in:  ['Sintomático', 'Asintomático']}
  TIPOCASO=['Sintomático', 'Asintomático']
  validates  :inicio_sint, inclusion:{in:  ['Dia', 'Mes','Año']}
  INISINTOMA=['Dia', 'Mes','Año']
  validates :tipo, inclusion:{in:  ['Gota Gruesa', 'Prueba Rápida']}
  TIPOEXAMEN= ['Gota Gruesa', 'Prueba Rápida']

  validates  :prueba,  inclusion:{in:  ['GG', 'PR']}
  TIPOPRUEVA= ['GG', 'PR']

  validates  :resultado,  inclusion:{in:  ['Pv', 'Pf','Mx','Neg','Nula']}
  RESULTADO= ['Pv', 'Pf','Mx','Neg','Nula']
  validates_presence_of :densidad_paras
  validates  :trat_superv,  inclusion: {in: ['Si', 'No']}
  TRATSUPER =['Si', 'No']
  validates  :req_trat_mal_grave, inclusion: {in: ['Si', 'No']}
  REQUIERE =['Si', 'No']
  validates :persis_sintom,  inclusion: {in: ['Si', 'No']}
  PERSISTEN =['Si', 'No']

end
