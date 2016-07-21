class FormAnatCitologica < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :hospital

  validates_presence_of :paciente
  validates_presence_of :hospital
  validates_presence_of :servicio
  validates_presence_of :diagnostico_clinico
  validates_presence_of :lugar_muestra
  validates_presence_of :diagnostico_operatorio

  NUMEROS = /\A[0-9]+\z/
  validates :cama, format: { :with => NUMEROS , message: "Ingrese solo numeros" }

  CONSERVANTE = ['Formol', 'Alcohol', 'Otros', 'Ninguno']
  validates :conservante, inclusion: {in: CONSERVANTE}

 end
