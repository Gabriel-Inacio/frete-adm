class Transation < ActiveRecord::Base
  attr_accessible :objectName, :objectId, :description, :value, :dateTransation

end
