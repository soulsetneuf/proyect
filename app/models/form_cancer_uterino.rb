class FormCancerUterino < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :hospital
  belongs_to :distrito

  #has_many :paciente

  validates :paciente, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates_numericality_of :edad_menarquia
  validates_presence_of :fecha_ult_menstruacion

  validates :nivel_social, inclusion: {in: (1..5)}
  NIVELSOCIAL = ['1', '2', '3', '4', '5']
  validates :n_emabarazos, inclusion: {in: (1..25)}
  EMBARAZOS = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25']
  validates :aspecto_cuello, inclusion: {in: ['Sano', 'Benigno', 'Atrófico', 'Sospechoso de neoplasia', 'Ectropion']}
  ASPECTO = ['Sano', 'Benigno', 'Atrófico', 'Sospechoso de neoplasia', 'Ectropion']
  validates :flujo_vaginal, inclusion: {in: ['Sin Flujo', 'Con Flujo']}
  FLUJO = ['Sin Flujo', 'Con Flujo']
  validates :lugar_de_muestra, inclusion: {in: ['Menorragia', 'Sinurragia Endocervical', 'Ninguno Exocervical', 'Endometrial', 'Otro Schiller']}
  LUGAR = ['Menorragia', 'Sinurragia Endocervical', 'Ninguno Exocervical', 'Endometrial', 'Otro Schiller']
  validates :tratamiento, inclusion: {in: ['Sin tratamiento', 'Dia termo', 'Criocirug. hormonal conizacion']}
  Tratamiento = ['Sin tratamiento', 'Dia termo', 'Criocirug. hormonal conizacion']
  validates :planificacion_familiar, inclusion: {in: ['No', 'Ritmo', 'DIU', 'Ligadura de trompas', 'Oral', 'Depo', 'Otros']}
  PLANIFICACION = ['No', 'Ritmo', 'DIU', 'Ligadura de trompas', 'Oral', 'Depo', 'Otros']
  validates :n_abortos, inclusion: {in: (1..24)}
  ABORTOS = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24']

  NUMEROS = /\A[0-9]+\z/
  validates :edad_menarquia, format: { :with => NUMEROS , message: "Ingrese solo numeros positivos" }
  validates :n_cesareas, format: { :with => NUMEROS , message: "Ingrese solo numeros positivos" }



end
