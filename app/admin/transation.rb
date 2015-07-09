ActiveAdmin.register Transation do

  action_item :only => [:show, :create, :update] do
    link_to(I18n.t('button.return'), admin_transations_path)
  end

  action_item :only => [:index] do
    link_to(I18n.t('button.report'), admin_transation_report_path)
  end

  form :partial => "form"

  actions :all, :except => [:destroy]

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
      params[:start_date] = "01/01/2000" if params[:start_date].nil?
      params[:end_date] = "01/01/3000" if params[:end_date].nil?
      @transations = Transation.where(:dateTransation => params[:start_date].to_date..params[:end_date].to_date)
      @transations = @transations.where(:truck_id => params[:truck_chosen]) if params[:truck_chosen].present?
      in_transation = @transations.where(:type_transation => true) if @transations.present?
      out_transation = @transations.where(:type_transation => false) if @transations.present?
      in_transation.present? ? @in = in_transation.sum(:value).to_i : @in = 0
      out_transation.present? ? @out = out_transation.sum(:value).to_i : @out = 0
      @liquid = @in - @out

      render "admin/transations/report"
    end
  end
end
