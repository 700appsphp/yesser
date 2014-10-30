class API::V1::EserviceCategoriesController < API::V1::BaseApiController
  actions :index, :show

  def collection
    agency_ids = Agency.where(organization: @organization).select("id")
    owner_ids = [@organization.id] + agency_ids
    @eservice_categories = EserviceCategory.where(owner_id: owner_ids)
  end
end
