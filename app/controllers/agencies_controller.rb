class AgenciesController < InheritedResources::Base
  before_action :set_agency, except: [:index, :new, :create]
  before_action :set_category
  before_filter :prevent_angency_creation_on_non_leaf_category, only: [:new, :create]
  before_action :set_eservice_categories, only: [:show]
  before_action :set_eservices, only: [:show]
  before_action :set_all_cities, only: [:new, :edit]
  before_action :set_city, only: [:show]
	def new
		@agency = Agency.new(category_id: params.fetch(:agency_category_id, nil))
	end

  def create
    @agency = Agency.new(permitted_params[:agency])
    @agency.organization = @organization
    if @agency.save
      flash[:info] = t("flash.actions.create.info", 
                          resource_name: t('activerecord.models.agency'))
      redirect_to @agency
    else
      set_all_cities
      render 'new'
    end
  end

  def update
    @agency = Agency.find(params[:id])
    if @agency.update_attributes(permitted_params[:agency])
      flash[:info] = t("flash.actions.update.info", 
                          resource_name: t('activerecord.models.agency'))
      redirect_to @agency
    else
      set_all_cities
      render 'edit'
    end
  end

  def move
    @categories = AgencyCategory.where(owner: @organization).arrange
  end

  def apply_move
    @agency = Agency.find(params[:id])
    if permitted_params[:uncategorized] == "yes"
      @agency.update_attribute(:category_id, nil)
    else
      @agency.update_attribute(:category_id, permitted_params[:agency][:category_id])
    end
    redirect_to @agency
  end

  def destroy
    destroy! do
      if @agency.category
        agency_category_agencies_path(@agency.category)
      else
        agency_categories_path
      end
    end
  end

  private
    def collection
      if @category
        @agencies = @category.agencies
      else
        @agencies = Agency.where(organization: @organization, category_id: nil)
      end
    end

    def permitted_params
      params.permit(:utf8, :_method, :authenticity_token, :commit, :id, :uncategorized,
                    agency: [:name, :description, :longitude, :latitude, 
                             :address, :logo, :website, :category_id, :city_id,
                              emails_attributes: [:id, :email, :_destroy],
                              faxes_attributes: [:id, :number, :_destroy],
                              phones_attributes: [:id, :number, :_destroy],
                            ])
    end

    def set_category
      if params.fetch(:agency_category_id, nil)
        @category = AgencyCategory.find(params[:agency_category_id])
      end
    end

    def prevent_angency_creation_on_non_leaf_category
      if @category and !@category.childless?
          flash[:danger] = t("agencies.creation_refused")
          redirect_to agency_category_agencies_path(@category)
      end
    end
    
    def set_agency
      @agency = Agency.find(params[:id])
    end

    def set_eservice_categories
      @eservice_categories = @agency.eservice_categories.arrange
    end
    
    def set_eservices
      @uncategorized_eservices = @agency.eservices.where(category_id: nil)
    end

    def set_all_cities
      @cities = City.all
    end

    def set_city
      @city = @agency.city
    end
end
