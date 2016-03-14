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
      params[:transation][:start_date] =  "01/01/2000" if !params[:transation][:start_date].present?
      params[:transation][:end_date] = "01/01/3000" if !params[:transation][:end_date].present?
      start_date = params[:transation][:start_date].to_date
      end_date = params[:transation][:end_date].to_date
      truck_id = params[:transation][:truck_chosen].to_i if params[:transation][:truck_chosen].present?

      @freights_spent = Freight.where("arrivalDate >= ? AND arrivalDate <= ?", start_date, end_date )
      @freights_receipt = Freight.where("receipt_date >= ? AND receipt_date <= ? AND situation = 1", start_date, end_date )
      @spents = Spent.where("date_spent >= ? AND date_spent <= ?", start_date, end_date )

      if truck_id.present?
        @freights_spent = @freights_spent.where(:truckId => truck_id)
        @freights_receipt  = @freights_receipt.where(:truckId =>  truck_id)
        @spents = @spents.where(:truck_id =>  truck_id)
      end

      @spent_total= @spents.sum(:value)
      @freights_spent_total = @freights_spent.sum(:spent)
      @freights_receipt_total = 0
      render "admin/transations/report"
    end
  end
end
