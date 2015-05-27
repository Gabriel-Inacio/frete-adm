ActiveAdmin.register Motorist do

  form :partial => "form"

  controller do
    def index
      index! do |format|
        @motorists = Motorist.where(type_person: 1)
        @motorists = @motorists.page(params[:page] || 1)
      end
    end
  end
end