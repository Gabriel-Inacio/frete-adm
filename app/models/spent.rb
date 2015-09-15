class Spent < ActiveRecord::Base

	belongs_to :truck, :class_name => "Truck", :foreign_key => "truck_id"

	attr_accessible :date_spent, :description, :value, :truck, :truck_id

	validates :truck_id, :presence => true

	after_create :save_transation

  def save_transation
      	Transation.new(:truckId => self.truck_id, :value => self.value, :objectId => self.id, :objectName => self.class.name, :dateTransation => self.date_spent, :description => self.description, :type_transation => false).save
  end

end
