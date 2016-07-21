class FormLeishmaniasis < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :hospital

  validates_presence_of :paciente
  validates_presence_of :hospital

  validates :tipo_lesion, inclusion: {in: ['Mucosa', 'Cutánea']}
  LESION =['Mucosa', 'Cutánea']
  validates_presence_of :ubicacion_lesion
  validates :n_muestras_tom, inclusion: {in: ['No de Muestras Tomadas', 'Post tratamiento']}
  NMUESTRAS =['No de Muestras Tomadas', 'Post tratamiento']
  validates :epd, inclusion: {in: ['+', '-']}
  EPD=['+', '-']
  validates  :idrm, inclusion: {in: ['+', '-']}
  IDRM =['+', '-']
  validates :cultivo, inclusion: {in:['+', '-']}
  CULTIVO =['+', '-']
  validates :pcr, inclusion: {in: ['+', '-']}
  PCR=['+', '-']
end
