ActiveAdmin.register Motorist do

  action_item :only => [:edit, :new, :create, :update, :paid_motorist] do
    link_to(I18n.t('button.return'), admin_motorists_path)
  end

  action_item :only => [:edit] do
    link_to(I18n.t('button.paid_motorist'),admin_motorist_paid_path(:id => motorist.id))
  end

  form :partial => "form"

  actions :all, :except => [:destroy, :show]

  index do
    column :name do |motorist|
      link_to motorist.name, edit_admin_motorist_path(motorist)
    end
    column :cpf
    column :phone
    column "" do |motorist|
      link_to(I18n.t('button.paid_motorist'),admin_motorist_paid_path(:id => motorist.id))
    end
  end

  controller do
    def index
      index! do |format|
        @motorists = Motorist.where(type_person: 1)
        @motorists = @motorists.page(params[:page] || 1)
      end
    end

    def paid_motorist
      @freights = Freight.by_motorist(params[:id]).by_paid(false)
      @value_total = 0
      @freights.each do |freight|
        @value_total += freight.valueKm * freight.distanceKm
      end
      @motorist = Motorist.find params[:id]
      render :paid_motorist
    end

    def paid_motorist_step_2
      @motorist = Motorist.find(params[:motorist][:id])
      @freights = Freight.by_motorist(@motorist.id).by_paid(false)
      @freights.each do |freight|
        freight.paidDriver = true
        freight.save
      end
      #Transation.new( :value => (params[:motorist][:total].to_f), :objectId => @motorist.id, :objectName => @motorist.class.name, :motoristId => @motorist.id, :truckId => params[:motorist][:truckId]  ,:dateTransation => Date.today, :description => "Pagamento do motorista #{@motorist.name}", :type_transation => false).save
      redirect_to action: :edit,  id: @motorist.id
    end
  end


end