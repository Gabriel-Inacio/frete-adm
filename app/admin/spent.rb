ActiveAdmin.register Spent do

  filter :truck, :as => :select,
         :collection => Truck.all.map { |s| ["#{s.board}", s.id] }
  filter :date_spent
  filter :value
  filter :description

  action_item :only => [:show, :create, :update] do
    link_to(I18n.t('button.return'), admin_spents_path)
  end

  form :partial => "form"

  actions :all, :except => [:show]

  index do
    column :truck do |spent|
        spent.truck.board if spent.truck.present?
    end
    column :value
    column :description
    column :date_spent do |spent|
      DateHelper.format_date(spent.date_spent)
    end
    actions
  end

  
  controller do

    def create
      params[:spent][:date_spent] = Date.parse(params[:spent][:date_spent])  if params[:spent][:date_spent].present?
      super
    end

    def update
      date_spent = Date.parse(params[:spent][:date_spent])  if params[:spent][:date_spent].present?
      super
    end

  end

end
