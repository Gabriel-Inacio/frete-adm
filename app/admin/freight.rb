ActiveAdmin.register Freight do


  action_item :only => [:edit, :new, :create, :update] do
    link_to(I18n.t('button.return'), admin_freights_path)
  end

  form :partial => "form"

  actions :all, :except => [:destroy, :show]

end
