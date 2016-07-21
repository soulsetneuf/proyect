class FormTuberculosis < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :hospital
end
