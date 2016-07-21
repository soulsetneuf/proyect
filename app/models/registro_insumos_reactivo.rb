class RegistroInsumosReactivo < ActiveRecord::Base
  belongs_to :insumo_reactivo
  belongs_to :form_laboratorio

  ESTADO = ['Entrada', 'Salida']
  validates :cantidad, :numericality => {:greater_than_or_equal_to => 1}, :presence => true
  validates_presence_of :insumo_reactivo
  validates :estado, :presence => true, inclusion: ESTADO

  after_validation :verificar_tipo_de_registro

  def verificar_tipo_de_registro
    if insumo_reactivo_id.present?
      insumo_reactivo = InsumoReactivo.find(insumo_reactivo_id)
      if estado == 'Entrada'
          insumo_reactivo.cantidad = insumo_reactivo.cantidad.to_i + cantidad.to_i
      elsif estado == 'Salida'
          insumo_reactivo.cantidad = insumo_reactivo.cantidad.to_i - cantidad.to_i
      end
      insumo_reactivo.save
    end
  end

  def self.total_on(date, id_insumo)
    where("date(created_at) = ? AND insumo_reactivo_id = ? ", date, id_insumo).sum(:cantidad)
  end
end
