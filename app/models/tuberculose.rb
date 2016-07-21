class Tuberculose < ActiveRecord::Base
  belongs_to :form_laboratorio
  belongs_to :paciente
end
