ActiveAdmin.register Client do
  controller do
    def index
      index! do |format|
        @clients = Client.where(type: 2)
        @clients = @clients.page(params[:page] || 1)
      end
    end
  end
end