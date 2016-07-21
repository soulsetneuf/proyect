class FormChaga < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :hospital

  validates_presence_of :paciente
  validates_presence_of :hospital

  #validates :muestra, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates  :muestra, inclusion: {in: ['PF', 'PL']}
  MUESTRA =['PF', 'PL']
  validates  :diag_serologico, inclusion:{in: ['LC', 'ELISA','HAI']}
  SEROLOGICO =['LC', 'ELISA','HAI']
  validates_presence_of  :conclucion_diag
  validates_presence_of    :diag_confir, {in: ['ELISA-RC', 'P-GEL','HAI']}
  CONFIRMACION =['ELISA-RC', 'P-GEL','HAI']
  validates_presence_of   :conclu_pueb_confir

end
