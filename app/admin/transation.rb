ActiveAdmin.register Transation do

  action_item :only => [:show, :create, :update] do
    link_to(I18n.t('button.return'), admin_transations_path)
  end

  action_item :only => [:index] do
    link_to(I18n.t('button.report'), admin_transation_report_path)
  end

  form :partial => "form"

  actions :all, :except => [:destroy, :new, :edit]

  index do
    column :description
    column :value
    column :dateTransation do |transation|
        DateHelper.format_date(transation.dateTransation)
    end
  end

  controller do

    def report

    end
  end

end
