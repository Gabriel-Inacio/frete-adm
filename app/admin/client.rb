ActiveAdmin.register Client do

  filter :name
  filter :cpf
  filter :phone
  
  action_item :only => [:edit, :new, :create, :update] do
    link_to(I18n.t('button.return'), admin_motorists_path)
  end

  form :partial => "form"

  actions :all, :except => [:show]

  index do
    column :name do |client|
      link_to client.name, edit_admin_client_path(client)
    end
    column :cpf
    column :phone
    actions
  end

  controller do
    def index
      index! do |format|
        # @clients = Client.where(type_person: 2)
        # @clients = @clients.page(params[:page] || 1)
      end
    end

  end
end