# encoding: UTF-8
module StatusHelper

  SITUATION = {
      0 => "A receber",
      1 => "Recebido"
  }

  SITUATION_OPTIONS = [
      OpenStruct.new( :id => 0, :name => 'A receber'),
      OpenStruct.new( :id => 1, :name => 'Recebido')
  ]

  PAID_DRIVER = {
      0 => "Não",
      1 => "sim",
      nil => "Não",
      false => "Não",
      true => "Sim"
  }
end