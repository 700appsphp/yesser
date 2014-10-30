class MessagesController < InheritedResources::Base
  actions :all
  has_scope :search

  def create
    @message = Message.new(permitted_params[:message])
    @message.organization = @organization
    create!
  end

  private
    def permitted_params
      params.permit(message: [:id, :title, :description, :image])
    end

    def collection
      @messages = end_of_association_chain.where(organization: current_organization)
    end
end
