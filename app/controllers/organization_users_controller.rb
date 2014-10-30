class OrganizationUsersController < ApplicationController
  def home
  end

  def edit
    @user = current_organization_user
  end

  def update_password
    @user = OrganizationUser.find(current_organization_user.id)
    if @user.update_with_password(organization_user_params)
      # Sign in the user by passing validation in case his password changed
      sign_in @user, bypass: true
        flash[:info] = t("flash.actions.update.info", 
                          resource_name: t("activerecord.models.organization_user"))
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def organization_user_params
    params.require(:organization_user).permit(:password, :password_confirmation, 
                                              :current_password)
  end
end
