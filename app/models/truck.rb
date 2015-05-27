class Truck < ActiveRecord::Base

  has_many :freights, :class_name => "Freight", :foreign_key => "truckId"

  accepts_nested_attributes_for :freights

  attr_accessible :board, :year, :axes, :freights

end
