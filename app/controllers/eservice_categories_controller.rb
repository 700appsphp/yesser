class EserviceCategoriesController < CategoriesController
  before_action :set_category, except: [:index, :new, :create]
  before_action :set_owner

  def index
    @categories = EserviceCategory.where(owner: @organization).arrange
    @uncategorized_eservices = Eservice.where(owner: @organization, category_id: nil)
    @uncategorized_eservices_count = @uncategorized_eservices.count
  end

  def new
    parent_id = params[:parent_id]
    if parent_id
      @parent = EserviceCategory.find(parent_id)
      @category = EserviceCategory.new(parent: @parent, owner: @parent.owner)
    else
      @category = EserviceCategory.new
      @category.owner = @owner
    end
  end

  def create
    @eservice_category = EserviceCategory.new(permitted_params[:eservice_category])
    create! { eservice_category_eservices_path(@eservice_category) }
  end

  def update
    update! { eservice_category_eservices_path(@eservice_category) }
  end

  def destroy
    destroy! do 
      if @category.agency_owned?
        @agency = @category.owner
        agency_path(@agency)
      else
        eservice_categories_path
      end
    end
  end


  private
    def set_category
      @category = EserviceCategory.find(params[:id])
    end

    def permitted_params
      params.permit(eservice_category: [:name, :description, :owner_id, 
                                        :owner_type, :parent_id, :type])
    end

    def set_owner
      if params.fetch(:agency_id, nil)
        @owner = Agency.find(params[:agency_id])
      else
        @owner = @organization
      end
    end
end
