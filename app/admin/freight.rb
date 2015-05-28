ActiveAdmin.register Freight do


  action_item :only => [:edit, :new, :create, :update] do
    link_to(I18n.t('button.return'), admin_freights_path)
  end

  form :partial => "form"

  actions :all, :except => [:destroy, :show]

  controller do
    def create
      params[:freight][:exitDate] = DateHelper.str_to_date2(params[:freight][:exitDate])
      params[:freight][:arrivalDate] = DateHelper.str_to_date2(params[:freight][:arrivalDate])
      binding.pry
      super
    end
  end

end
