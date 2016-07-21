class Inventario < ActiveRecord::Base
  belongs_to :insumo_reactivo
  belongs_to :form_laboratorio
  belongs_to :hospital

  validates_presence_of :nombre
  validates_presence_of :stock
  validates_presence_of :tipo

end
