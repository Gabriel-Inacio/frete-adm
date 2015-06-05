class Person < ActiveRecord::Base
  attr_accessible :name, :cpf, :type_person, :phone
end
