class Freight < ActiveRecord::Base

  belongs_to :truck, class_name: "Truck", foreign_key: "truckId"
  belongs_to :motorist, class_name: "Motorist", foreign_key: "motoristId"
  belongs_to :client, class_name: "Client", foreign_key: "clientId"

  attr_accessible :truckId, :truck, :motorist, :motoristId, :client, :clientId, :origin,
      :destination, :valueKm, :distanceKm, :description, :situation, :spent, :descriptionSpent,
      :numberHead, :exitDate, :arrivalDate, :paidDriver, :receipt_date

  scope :by_motorist, lambda{|motorist_id| where("motoristId = ?", motorist_id)}

  scope :by_paid, lambda{|paid| where("paidDriver = ?", paid)}

  validates :truckId, :motoristId, :clientId, :valueKm, :distanceKm, :origin, :destination, :situation,
            :exitDate, :arrivalDate, :presence => true

  validates :spent, :numericality => { :greater_than_or_equal_to => 0 }


end
