class FormLaboratorio < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :usuario
  belongs_to :hospital

  has_many :inventarios
  has_many :insumo_reactivos

  def to_s
    "#{nombre}"
  end

end
