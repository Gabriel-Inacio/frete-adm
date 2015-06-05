ActiveAdmin.register Motorist do

  action_item :only => [:edit, :new, :create, :update] do
    link_to(I18n.t('button.return'), admin_motorists_path)
  end

  form :partial => "form"

  actions :all, :except => [:destroy, :show]

  index do
    column :name
    column :cpf
    column :phone
    column "" do |motorist|
      link_to "editar", edit_admin_motorist_path(motorist)
    end
  end

  controller do
    def index
      index! do |format|
        @motorists = Motorist.where(type_person: 1)
        @motorists = @motorists.page(params[:page] || 1)
      end
    end

  end
end