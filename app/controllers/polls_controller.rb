class PollsController < InheritedResources::Base
  actions :all, except: [:show]
  has_scope :search

  def create
    @poll = Poll.new(permitted_params[:poll])
    @poll.organization = current_organization
    create!{ polls_path }
  end
  def update
    update!{ polls_path }
  end
  private

    def collection
      @polls = end_of_association_chain.where(organization: current_organization)
    end

    def permitted_params
      params.permit(poll: [:id, :question, answers_attributes: [:id, :answer, :_destroy]])
    end

end
