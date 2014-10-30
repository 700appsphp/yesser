class EservicesController < InheritedResources::Base
  before_action :set_eservice, except: [:index, :new, :create]
  before_action :set_category
  before_action :set_agency
  before_action :set_owner
  before_filter :prevent_angency_creation_on_non_leaf_category, only: [:new, :create]

  def new
    if @category
      @eservice = Eservice.new(category: @category)
    else
      @eservice = Eservice.new
    end
    @eservice.owner = @owner
  end

  def show
    @eservice = Eservice.find(params[:id])
    if @eservice.organization_owned? 
      @owner = @organization
    else
      @owner = Agency.find(@eservice.owner_id)
    end
    show!
  end

  def create
    @eservice = Eservice.new(permitted_params[:eservice])
    create!
  end

  def update
    update!
  end

  def move
    @categories = EserviceCategory.where(owner: @eservice.owner).arrange
  end

  def apply_move
    @eservice = Eservice.find(params[:id])
    if permitted_params[:uncategorized] == "yes"
      @eservice.update_attribute(:category_id, nil)
    else
      cat = EserviceCategory.find(permitted_params[:eservice][:category_id])
      if cat.is_childless?
        @eservice.update_attribute(:category_id, cat.id)
      end
    end
    flash[:info] = t('flash.actions.update.info', 
                      resource_name: t('activerecord.models.eservice'))
    redirect_to @eservice
  end

  def destroy
    destroy! do
      if @eservice.category
        eservice_category_eservices_path(@eservice.category)
      elsif @eservice.agency_owned?
        @agency = @eservice.owner
        agency_path(@agency)
      else
        eservice_categories_path
      end
    end
  end

  private
    def collection
      if @category
        @eservices = @category.eservices
      else
        @eservices = Eservice.where(category_id: nil, owner: @organization)
      end
    end

    def set_category
      if params.fetch(:eservice_category_id, nil)
        @category = EserviceCategory.find(params[:eservice_category_id])
      end
    end
    def set_eservice
      @eservice = Eservice.find(params[:id])
    end
    def set_agency
      if params.fetch(:agency_id, nil)
        @agency = Agency.find(params[:agency_id])
      end
    end
    def set_owner
      if @eservice
        @owner = @eservice.owner
      elsif @category
        @owner = @category.owner
      elsif @agency
        @owner = @agency
      else
        @owner = @organization
      end
    end
    def permitted_params
      params.permit(:utf8, :_method, :authenticity_token, :commit, :id, :uncategorized,
                    eservice: [:name, :description, :url, :owner_id, 
                    :owner_type, :category_id, :logo])
    end

    def prevent_angency_creation_on_non_leaf_category
      if @category and !@category.childless?
          flash[:danger] = t("eservices.creation_refused")
          redirect_to eservice_category_eservices_path(@category)
      end
    end
end
