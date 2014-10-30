class ComplaintsController < ApplicationController
  before_action :set_complaint

  def index
  end

  def switch_method
    if params[:use] == "amer"
      @complaint.use_amer
      render 'agency_edit'
    elsif params[:use] == "email"
      @complaint.use_email
      render 'email_edit'
    end
  end

  def email_edit
  end

  def email_update
    unless @complaint.id
      @complaint.organization = @organization
    end
    @complaint.use_email
    if @complaint.update_attributes(email_edit_params)
      flash[:info] = t('flash.actions.update.info',
                        resource_name: t('activerecord.models.complaint'))
      redirect_to complaints_index_path
    else
      render 'email_edit'
    end
  end

  def agency_edit
  end

  def agency_update
    unless @complaint.id
      @complaint.organization = @organization
    end
    @complaint.use_amer
    if @complaint.update_attributes(agency_edit_params)
      flash[:info] = t('flash.actions.update.info',
                        resource_name: t('activerecord.models.complaint'))
      redirect_to complaints_index_path
    else
      render 'agency_edit'
    end
  end

  private
    def set_complaint
      unless @organization.complaint
        @complaint = Complaint.new
      else
        @complaint = @organization.complaint
      end
    end

    def email_edit_params
      params.require(:complaint).permit(:email)
    end
    def agency_edit_params
      params.require(:complaint).permit(:agency_id)
    end
end
