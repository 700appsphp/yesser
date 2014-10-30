class API::V1::EservicesController < API::V1::BaseApiController
  actions :index, :show
  before_action :set_eservice, only: [:show]

  def set_eservice
    @eservice = Eservice.find(params[:id])
  end
  def collection
    agency_ids = Agency.where(organization: @organization).select("id")
    owner_ids = [@organization.id] + agency_ids
    @eservices = Eservice.where(owner_id: owner_ids)
  end
end
