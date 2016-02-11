ActiveAdmin.register Truck do

  filter :board
  filter :axes
  filter :year

  action_item :only => [:edit, :new, :create, :update] do
    link_to(I18n.t('button.return'), admin_trucks_path)
  end

  form :partial => "form"

  actions :all, :except => [:show]

  index do
    column :board do |truck|
      link_to truck.board , edit_admin_truck_path(truck)
    end
    column :year
    actions
  end

  controller do

  end


end
