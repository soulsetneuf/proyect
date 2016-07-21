class Tuberculosi < ActiveRecord::Base
  belongs_to :form_laboratorio
  belongs_to :paciente

  validates_presence_of :paciente
  validates_presence_of :form_laboratorio
end
