class InsumoReactivo < ActiveRecord::Base
  belongs_to :form_laboratorio

  has_many :inventarios
  has_many :kardexes
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates_presence_of :nombre
  #validates_presence_of :cantidad
  #validates_presence_of :costo_unitario
  #validates_presence_of :costo_total
  validates_presence_of :unidad_medida
  
  #NUMEROS = /\A[0-9]+\z/
  LETRAS = /\A[a-zA-Z]+\z/
  #validates :cantidad, format: { :with => NUMEROS , message: "Ingrese solo numeros positivos" }
  #validates :costo_unitario, format: { :with => NUMEROS , message: "Ingrese solo numeros positivos" }
  #validates :costo_total, format: { :with => NUMEROS , message: "Ingrese solo numeros positivos" }
  validates :unidad_medida, format: { :with => LETRAS , message: "Ingrese solo letras" }

#validates_presence_of :tipo
#validates_presence_of :nombre
#validates_presence_of :cantidad
#validates_presence_of :costo_unitario
#validates_presence_of :costo_total

  scope :order_name_tipo, -> { order(tipo: :asc, nombre: :asc) }
  scope :order_name, -> { order(nombre: :asc) }

  def to_s
    "#{nombre}"
  end

  private
#ensurethattherearenolineitemsreferencingthisproduct
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end


end
 ()