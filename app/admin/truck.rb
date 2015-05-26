ActiveAdmin.register Truck do

  controller do
    def create
      binding.pry
      truck =  Truck.new(params[:truck])
      truck.save
    end
  end


end
