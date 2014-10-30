class RssesController < InheritedResources::Base
  actions :all
  before_filter :set_rss

  def create
    @rss = Rss.new build_resource_params[0]
    @rss.organization = @organization
    create! { show_rsses_path }
  end

  def update
    update!(success: t("flash.actions.update.info", 
            resource_name: t("rss.url"))) do 
      show_rsses_path
    end
  end

  def destroy
    destroy! { show_rsses_path }
  end

  private
    def set_rss
      if @organization.rss
        @rss = @organization.rss
      else
        @rss = Rss.new
      end
    end

    def build_resource_params
      [params.require(:rss).permit(:url)]
    end
end
