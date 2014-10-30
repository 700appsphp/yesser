class OrganizationsController < ApplicationController

  def edit
    @target_organization = Organization.find(current_organization.id)
  end

  def update
    @target_organization = Organization.find(current_organization.id)
    if @target_organization.update_attributes(organization_params)
      flash[:info] = t("flash.actions.update.info", 
                        resource_name: @target_organization.name)
      redirect_to @target_organization
    else
      render 'edit'
    end
  end

  private 

    def organization_params
      params.require(:organization).permit(:name, :description, :longitude, 
                     :latitude, :address, :mission, :vision, :message, :logo,
                     :website,
                     emails_attributes: [:id, :email, :_destroy],
                     faxes_attributes: [:id, :number, :_destroy],
                     phones_attributes: [:id, :number, :_destroy],
                     social_networks_attributes: [:id, :name, :url, :_destroy])
    end
end
