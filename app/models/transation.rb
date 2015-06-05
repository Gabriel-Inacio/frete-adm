class Transation < ActiveRecord::Base

  belongs_to :truck, :class_name => "Truck", :foreign_key => "truckId"
  attr_accessible :objectName, :objectId, :description, :value, :dateTransation,  :truck, :truckId

  accepts_nested_attributes_for :truck

end
