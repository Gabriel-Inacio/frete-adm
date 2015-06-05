ActiveAdmin.register Client do

  action_item :only => [:edit, :new, :create, :update] do
    link_to(I18n.t('button.return'), admin_motorists_path)
  end

  form :partial => "form"

  actions :all, :except => [:destroy, :show]

  index do
    column :name
    column :cpf
    column :phone
    column "" do |client|
      link_to "editar", edit_admin_client_path(client)
    end
  end

  controller do
    def index
      index! do |format|
        @clients = Client.where(type_person: 2)
        @clients = @clients.page(params[:page] || 1)
      end
    end

  end
end