class API::V1::AppsController < API::V1::BaseApiController
  actions :show, :index
  skip_before_action :set_organization
  has_scope :related_organization, :platform
  protected
  def begin_of_association_chain
  end
end
