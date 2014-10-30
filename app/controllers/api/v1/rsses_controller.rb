class API::V1::RssesController < API::V1::BaseApiController
  actions :show
  # before_action :set_rss

  private
  def resource
    @rss = @organization.rss or Rss.new
  end
end
