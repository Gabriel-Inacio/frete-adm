class Client < Person
  attr_accessible :name, :cpf, :type_person

  before_create :set_type_person

  def set_type_person
    self.type_person = 2
  end
end
