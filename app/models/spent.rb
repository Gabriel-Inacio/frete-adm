class Spent < ActiveRecord::Base

	belongs_to :truck, :class_name => "Truck", :foreign_key => "truck_id"

	attr_accessible :date_spent, :description, :value, :truck, :truck_id, :id

	validates :truck_id, :date_spent, :value, :presence => true

end
