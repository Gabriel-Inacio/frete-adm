class Freight < ActiveRecord::Base

  belongs_to :truck, class_name: "Truck", foreign_key: "truckId"
  belongs_to :motorist, class_name: "Motorist", foreign_key: "motoristId"
  belongs_to :client, class_name: "Client", foreign_key: "clientId"

  attr_accessible :truckId, :truck, :motorist, :motoristId, :client, :clientId, :origin,
      :destination, :valueKm, :distanceKm, :description, :situation, :spent, :descriptionSpent,
      :numberHead, :exitDate, :arrivalDate, :paidDriver

  validates :truckId, :motoristId, :clientId, :presence => true

  validates :spent, :numericality => { :less_than_or_equal_to => 0 }


  after_update :save_transation

  after_create :save_transation_freigh_value


  def save_transation
    if ( self.situation_changed?)
      binding.pry
      Transation.new(:truckId => self.truckId, :value => (self.valueKm * self.distanceKm), :objectId => self.id, :objectName => self.class.name, :dateTransation => Date.today).save
    end
  end

  def save_transation_freigh_value
    if (self.situation == true)
      Transation.new(:truckId => self.truckId, :value => (self.valueKm * self.distanceKm), :objectId => self.id, :objectName => self.class.name, :dateTransation => Date.today).save
    end
  end


end
