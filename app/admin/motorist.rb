ActiveAdmin.register Motorist do

  action_item :only => [:edit, :new, :create, :update] do
    link_to(I18n.t('button.return'), admin_motorists_path)
  end

  form :partial => "form"

  actions :all, :except => [:destroy, :show]

  controller do
    def index
      index! do |format|
        @motorists = Motorist.where(type_person: 1)
        @motorists = @motorists.page(params[:page] || 1)
      end
    end

  end
end