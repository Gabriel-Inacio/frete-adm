class Freight < ActiveRecord::Base

  belongs_to :truck, class_name: "Truck", foreign_key: "truckId"
  belongs_to :motorist, class_name: "Motorist", foreign_key: "motoristId"
  belongs_to :client, class_name: "Client", foreign_key: "clientId"

  attr_accessible :truckId, :truck, :motorist, :motoristId, :client, :clientId, :origin,
      :destination, :valueKm, :distanceKm, :description, :situation, :spent, :descriptionSpent,
      :numberHead, :exitDate, :arrivalDate, :paidDriver

  #validates :cpf, cpf: true, :allow_blank => true

end
