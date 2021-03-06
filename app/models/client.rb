class Client  < ActiveRecord::Base

  self.table_name = "People"

  default_scope { where(type_person: '2') }

  before_create :set_type_person

  has_many :freights, :class_name => "Freight", :foreign_key => "clientId"

  accepts_nested_attributes_for :freights

  attr_accessible :name, :cpf, :type_person, :freights, :phone

  validates :name, :presence => true

  validates :cpf, cpf: true, :allow_blank => true

  validates :cpf, :uniqueness => { :allow_blank => true}

  def set_type_person
    self.type_person = 2
  end
end
