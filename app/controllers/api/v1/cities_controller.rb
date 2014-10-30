class API::V1::CitiesController < API::V1::BaseApiController
  actions :index, :show
  skip_before_action :set_organization
end
