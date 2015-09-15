class Motorist < Person

  before_create :set_type_person

  has_many :freights, :class_name => "Freight", :foreign_key => "motoristId"

  accepts_nested_attributes_for :freights

  attr_accessor :percentage, :salary, :total, :value_total_freight

  attr_accessible :name, :cpf, :type_person, :freights, :phone, :salary, :percentage, :total, :value_total_freight

  validates :cpf, cpf: true, :allow_blank => true

  validates :cpf, :uniqueness => { :allow_blank => true}

  def set_type_person
    self.type_person = 1
  end

end
