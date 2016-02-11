class Valley < ActiveRecord::Base

  belongs_to :motorist, :class_name => "Motorist", :foreign_key => "motoristId"

  attr_accessible :description, :value, :date, :status, :created_at, :updated_at, :motorist, :motoristId

  accepts_nested_attributes_for :motorist

  validates :value, :date, :motoristId, :presence => true

end
