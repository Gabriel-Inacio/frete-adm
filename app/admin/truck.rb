ActiveAdmin.register Truck do

  action_item :only => [:edit, :new, :create, :update] do
    link_to(I18n.t('button.return'), admin_trucks_path)
  end

  form :partial => "form"

  actions :all, :except => [:destroy, :show]

  index do
    column :board
    column :year
    column "" do  |truck|
      link_to "edit", edit_admin_truck_path(truck)
    end
  end

  controller do

  end


end
