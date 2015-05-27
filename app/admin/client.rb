ActiveAdmin.register Client do

  form :partial => "form"

  controller do
    def index
      index! do |format|
        @clients = Client.where(type_person: 2)
        @clients = @clients.page(params[:page] || 1)
      end
    end

  end
end