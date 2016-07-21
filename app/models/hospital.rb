class Hospital < ActiveRecord::Base
  has_many :inventarios
  has_many :biopsias_forms
  has_many :form_anat_citologicas
  has_many :form_cancer_uterinos
  has_many :form_chagas
  has_many :form_laboratorios
  has_many :form_leishmaniasises
  has_many :form_liquidos
  has_many :form_malariums
  has_many :form_tuberculosises

  validates_presence_of :nombre
  validates_presence_of :sigla
  validates_presence_of :ciudad
  validates_presence_of :descripcion
  validates_presence_of :provincia
  validates_presence_of :direccion
  validates_presence_of :distrito
  validates_presence_of :establecimiento
  validates_presence_of :centro_salud

  LETRAS_ESPACIO = /\A[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]+\z/
  LETRAS_ESPACIO_NUMERO = /\A[0-9A-Za-z]+(\s*[0-9A-Za-z]*)*[0-9A-Za-z]+\z/
  NUMEROS = /\A[0-9]+\z/
  LETRAS_NUMERO = /\A[0-9A-Za-z]+\z/
  validates :nombre, format: { :with => LETRAS_ESPACIO , message: "Ingrese solo letras y espacio" }
  validates :sigla, format: { :with => LETRAS_NUMERO , message: "Ingrese solo letras y numeros" }
  validates :direccion, format: { :with => LETRAS_ESPACIO_NUMERO , message: "Ingrese solo letras,espacio y numeros" }
  #validates :apellidos, format: { :with => LETRAS_ESPACIO , message: "Ingrese solo letras y espacio" }
  #validates :direccion, format: { :with => LETRAS_ESPACIO_NUMERO , message: "Ingrese solo letras, espacios y numeros" }
  #validates :ciudad, format: { :with => LETRAS_ESPACIO , message: "Ingrese solo letras y espacio" }
  #validates :telefono, format: { :with => NUMEROS , message: "Ingrese solo numeros positivos" }

  def to_s
    "#{nombre}"
  end

  def image_file=(input_data)
    self.logo = input_data.original_filename
    directory = "public/hospitales"
    path = File.join(directory, logo)
    File.open(path, "wb") { |f| f.write(input_data.read) }
  end

end
