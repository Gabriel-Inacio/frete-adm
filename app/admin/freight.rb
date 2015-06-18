ActiveAdmin.register Freight do

  action_item :only => [:edit, :new, :create, :update] do
    link_to(I18n.t('button.return'), admin_freights_path)
  end

  form :partial => "form"

  actions :all, :except => [:destroy, :show]

  index do
    column :client do |freight|
      link_to freight.client.name, edit_admin_client_path(freight.truck)
    end
    column :motorist do |freight|
      link_to freight.motorist.name, edit_admin_motorist_path(freight.motorist)
    end
    column :origin
    column :destination
    column :exitDate do |freight|
      DateHelper.format_date(freight.exitDate)
    end
    column :arrivalDate do |freight|
      DateHelper.format_date(freight.arrivalDate)
    end
    column :situation do |freight|
      status_tag(StatusHelper::SITUATION[freight.situation],(freight.situation == 0 ? :warning : :ok))
    end
    column :paidDriver do |freight|
      status_tag(StatusHelper::PAID_DRIVER[freight.paidDriver],(freight.paidDriver == 0 ? :warning : :ok))
    end
    column "" do |freight|
      link_to "editar", edit_admin_freight_path(freight)
    end
  end

  controller do
    def create
      params[:freight][:exitDate] = DateHelper.str_to_date2(params[:freight][:exitDate])
      params[:freight][:arrivalDate] = DateHelper.str_to_date2(params[:freight][:arrivalDate])
      super
    end

    def update
      arrivalDate = Date.parse(params[:freight][:arrivalDate])
      exitDate = Date.parse(params[:freight][:exitDate])
      super
    end

  end

end
