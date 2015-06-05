class Client < Person

  before_create :set_type_person

  has_many :freights, :class_name => "Freight", :foreign_key => "clientId"

  accepts_nested_attributes_for :freights

  attr_accessible :name, :cpf, :type_person, :freights, :phone

  def set_type_person
    self.type_person = 2
  end
end
