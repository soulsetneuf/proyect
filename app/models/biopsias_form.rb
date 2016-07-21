class BiopsiasForm < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :hospital

  validates_presence_of :paciente
  validates_presence_of :hospital
  validates_presence_of :servicio
  validates_presence_of :diag_clinico
  validates_presence_of :macroscopico
  validates_presence_of :microscopico
  validates_presence_of :diagnostico

end
