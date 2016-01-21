ActiveAdmin.register Transation do

  action_item :only => [:show, :create, :update] do
    link_to(I18n.t('button.return'), admin_transations_path)
  end

  #action_item :only => [:index] do
  #  link_to(I18n.t('button.report'), admin_transation_report_path)
  #end

  form :partial => "form"

  actions :all, :except => [:create, :new, :destroy]

  index do
    column "referente ao" do  |transation|
      if transation.objectName == "Freight"
        link_to "frete", edit_admin_freight_path(transation.objectId)
      elsif transation.objectName == "Spent"
        link_to "gasto", edit_admin_spent_path(transation.objectId)
      end
    end
    column :value
    column :description
    column :dateTransation do |transation|
      DateHelper.format_date transation.dateTransation
    end
  end

  
  controller do

    layout "active_admin"

    def index
      @transation = Transation.new
      super
    end

    def get_report
      params[:transation][:start_date].present? ? params[:start_date] = DateHelper.format_date(DateHelper.str_to_date2 params[:transation][:start_date]) : params[:start_date] = "01/01/2000"
      params[:transation][:end_date].present? ? params[:end_date] = DateHelper.format_date(DateHelper.str_to_date2 params[:transation][:end_date]) : params[:end_date] = "01/01/3000"

      if params[:transation][:truck_chosen].present?
        @freights_spent = (Freight.where("exitDate >= ? OR exitDate <= ?", params[:start_date].to_date, params[:end_date].to_date ).where(:truckId =>  params[:transation][:truck_chosen].to_i))
        @freights_receipt  = (Freight.where("receipt_date >= ? OR receipt_date <= ?", params[:start_date].to_date, params[:end_date].to_date ).where(:truckId =>  params[:transation][:truck_chosen].to_i))
        @spents = (Spent.where("date_spent >= ? OR date_spent <= ?", params[:start_date].to_date, params[:end_date].to_date ).where(:truck_id =>  params[:transation][:truck_chosen].to_i))
      else
        @freights_spent = Freight.where("exitDate >= ? OR exitDate <= ?", params[:start_date].to_date, params[:end_date].to_date )
        @freights_receipt = Freight.where("receipt_date >= ? OR receipt_date <= ?", params[:start_date].to_date, params[:end_date].to_date )
        @spents = Spent.where("date_spent >= ? OR date_spent <= ?", params[:start_date].to_date, params[:end_date].to_date )
      end

      render "admin/transations/report"
    end
  end
end
