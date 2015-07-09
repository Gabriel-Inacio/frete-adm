ActiveAdmin.register Spent do

  action_item :only => [:show, :create, :update] do
    link_to(I18n.t('button.return'), admin_spents_path)
  end

  form :partial => "form"

  actions :all, :except => [:destroy, :show]

  index do
    column :truck do |spent|
        spent.truck.board if spent.truck.present?
    end
    column :value
    column :description
    column :date_spent do |spent|
      DateHelper.format_date spent.date_spent
    end
    actions
  end

  
  controller do

  
  end

end
