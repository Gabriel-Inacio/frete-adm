class Motorist < Person

  before_create :set_type_person

  has_many :freights, :class_name => "Freight", :foreign_key => "motoristId"

  has_many :paid_motorists, :class_name => "PaidMotorist", :foreign_key => "motoristId", :dependent => :destroy

  accepts_nested_attributes_for :freights, :paid_motorists

  attr_accessor :percentage, :salary, :total, :value_total_freight, :truckId

  attr_accessible :name, :cpf, :type_person, :freights, :paid_motorists, :phone, :salary, :percentage, :total, :value_total_freight

  validates :name, :presence => true

  validates :cpf, cpf: true, :allow_blank => true

  validates :cpf, :uniqueness => { :allow_blank => true}

  def set_type_person
    self.type_person = 1
  end

end
