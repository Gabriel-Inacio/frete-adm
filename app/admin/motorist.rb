ActiveAdmin.register Motorist do
  controller do
    def index
      index! do |format|
        @motorists = Motorist.where(type: 1)
        @motorists = @motorists.page(params[:page] || 1)
      end
    end
  end
end