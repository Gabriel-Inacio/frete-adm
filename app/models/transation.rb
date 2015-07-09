class Transation < ActiveRecord::Base

  belongs_to :truck, :class_name => "Truck", :foreign_key => "truckId"

  attr_accessor :start_date, :end_date, :truck_chosen

  attr_accessible :objectName, :objectId, :description, :value, :dateTransation,  :truck, :truckId, :truck_chosen,  :start_date, :end_date, :type_transation

  accepts_nested_attributes_for :truck

end