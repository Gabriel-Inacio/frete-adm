class PaidMotorist < ActiveRecord::Base

  belongs_to :truck, :class_name => "Truck", :foreign_key => "truckId"

  belongs_to :motorist, :class_name => "Motorist", :foreign_key => "motoristId"

  attr_accessible :description, :value, :date,  :truck, :truckId, :motorist, :motoristId

  accepts_nested_attributes_for :truck, :motorist

end
