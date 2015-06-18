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
      end
    end
    column :value
    column :description
    column :dateTransation do |transation|
      DateHelper.format_date transation.dateTransation
    end
  end
  controller do

    def get_report
      binding.pry
      render "admin/transations/report"
    end
  end
end
