class Paciente < ActiveRecord::Base
  belongs_to :form_laboratorio

  has_many :biopsias_forms
  has_many :diagnosticos
  has_many :form_anat_citologicas
  has_many :form_cancer_uterinos
  has_many :form_chagas
  has_many :form_laboratorios
  has_many :form_leishmaniasises
  has_many :form_liquidos
  has_many :form_malariums
  has_many :form_tuberculosises
  has_many :form_laboratorios

  validates_presence_of :nombres
  validates_presence_of :apellidos

  #validates :tipo, inclusion: {in: %w(urbano rural)}
  #TIPO = ['urbano', 'rural']

  validates :sexo, inclusion: {in: %w(Femenino Masculino)}
  SEXO =['Femenino', 'Masculino']

  LETRAS_ESPACIO = /\A[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]+\z/
  LETRAS_ESPACIO_NUMERO = /\A[0-9A-Za-z]+(\s*[0-9A-Za-z]*)*[0-9A-Za-z]+\z/
  NUMEROS = /\A[0-9]+\z/
  validates :nombres, format: { :with => LETRAS_ESPACIO , message: "Ingrese solo letras y espacio" }
  validates :apellidos, format: { :with => LETRAS_ESPACIO , message: "Ingrese solo letras y espacio" }
  validates :direccion, format: { :with => LETRAS_ESPACIO_NUMERO , message: "Ingrese solo letras, espacios y numeros" }
  validates :ciudad, format: { :with => LETRAS_ESPACIO , message: "Ingrese solo letras y espacio" }
  validates :telefono, format: { :with => NUMEROS , message: "Ingrese solo numeros positivos" }


  #def to_s
    #"#{nombres} #{apellidos}"
  #end

  def self.calcular_edad(fecha_de_nacimiento)
    if fecha_de_nacimiento.present?
      Date.today.year - fecha_de_nacimiento.to_date.year
    end
  end
end
