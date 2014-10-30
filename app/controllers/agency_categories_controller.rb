class AgencyCategoriesController < CategoriesController
  before_action :set_category, except: [:index, :new, :create]

  def index
    @categories = AgencyCategory.where(owner: @organization).arrange
    @uncategorized_agencies = Agency.where(organization: @organization, category_id: nil)
    @uncategorized_agencies_count = @uncategorized_agencies.count
  end

  def new
    if params[:parent_id]
      @parent = AgencyCategory.find(params[:parent_id])
      @category = AgencyCategory.new(parent: @parent)
    else
      @category = AgencyCategory.new
    end
  end

  def create
    @agency_category = AgencyCategory.new(permitted_params[:agency_category])
    @agency_category.owner = @organization
    create! { agency_category_agencies_path(@agency_category) }
  end

  def update
    update! { agency_category_agencies_path(@agency_category) }
  end

  def destroy
    destroy!
  end


  private
  def set_category
    @category = AgencyCategory.find(params[:id])
  end
  def permitted_params
    params.permit(agency_category: [:name, :description, :parent_id])
  end
end
