class API::V1::BaseApiController < InheritedResources::Base
  respond_to :json
  skip_before_action :authenticate_organization_user!
  before_action :set_organization
  has_scope :created_after

  protected
    def begin_of_association_chain
      @organization
    end

  private
    def set_organization
      if params.fetch(:organization_id, nil)
        @organization = Organization.find(params[:organization_id])
      else
        @organization = Organization.find(params[:id])
      end
    end
end
