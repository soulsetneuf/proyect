class FormLiquido < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :hospital

  validates_presence_of  :paciente
  validates_presence_of  :hospital
  validates_presence_of  :servicio
  validates_presence_of  :diag_clinico
  validates_presence_of  :datos_impot
  validates_presence_of  :fun
  validates_presence_of  :fup
  validates_presence_of  :hormonoterapia
  validates_presence_of  :radioterapia

end
