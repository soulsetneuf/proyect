class FormCultivo < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :hospital

  validates_presence_of :paciente
  validates_presence_of :hospital
end
