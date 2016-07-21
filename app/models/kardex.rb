class Kardex < ActiveRecord::Base
  belongs_to :insumo_reactivo

  validates_presence_of  :fecha
  validates_presence_of  :reg_entrada
  validates_presence_of  :reg_salida
  validates_presence_of  :saldo
  validates_presence_of  :recibido_entregado
end
