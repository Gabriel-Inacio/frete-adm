ActiveAdmin.register Freight do

  action_item :only => [:edit, :new, :create, :update] do
    link_to(I18n.t('button.return'), admin_freights_path)
  end

  filter :motorist
  filter :client
  filter :truck, :as => :select,
         :collection => Truck.all.map { |s| ["#{s.board}", s.id] }

  form :partial => "form"

  actions :all, :except => [:show]

  index do
    column :client do |freight|
      link_to freight.client.name, edit_admin_client_path(freight.truck) if freight.client.present?
    end
    column :motorist do |freight|
      link_to freight.motorist.name, edit_admin_motorist_path(freight.motorist) if freight.motorist.present?
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
    actions
  end

  controller do

    def create
      params[:freight][:exitDate] = Date.parse(params[:freight][:exitDate]) if params[:freight][:exitDate].present?
      params[:freight][:arrivalDate] =  Date.parse(params[:freight][:arrivalDate])if params[:freight][:arrivalDate].present?
      params[:freight][:receipt_date] = Date.parse(params[:freight][:receipt_date]) if params[:freight][:receipt_date].present?
      params[:freight][:paidDriver] = false
      super
    end

    def update
      arrivalDate = Date.parse(params[:freight][:arrivalDate]) if params[:freight][:exitDate].present?
      exitDate = Date.parse(params[:freight][:exitDate]) if params[:freight][:arrivalDate].present?
      receipt_date = Date.parse(params[:freight][:receipt_date]) if params[:freight][:receipt_date].present?
      super
    end

  end

end
