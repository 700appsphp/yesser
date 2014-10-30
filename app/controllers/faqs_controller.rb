class FaqsController < InheritedResources::Base
  actions :all, except: [:show]
  has_scope :search

  def create
    @faq = Faq.new(permitted_params[:faq])
    @faq.organization = @organization
    create! { faqs_path }
  end

  def update
    update! { faqs_path }
  end

  private
    def permitted_params
      params.permit(faq: [:id, :question, :answer])
    end

    def collection
      @faqs = end_of_association_chain.where(organization: current_organization)
    end
end
