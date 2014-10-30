class API::V1::ComplaintController < API::V1::BaseApiController
  before_action :set_complaint
  
  def index
  end


  private
    def set_complaint
      unless @organization.complaint
        @complaint = Complaint.new
      else
        @complaint = @organization.complaint
      end
    end
end
