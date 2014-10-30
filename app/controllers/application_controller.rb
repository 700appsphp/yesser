class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_organization_user!, unless: :admin_controller?

  before_action :set_organization, unless: :admin_controller?
  before_filter :set_i18n_locale_from_params

  layout :layout_by_resource

  private

  def set_organization
    @organization = current_organization
  end

  def current_organization
    if current_organization_user
      current_organization_user.organization
    end
  end

  def admin_controller?
    params[:controller].match("admin/*")
  end

  def set_i18n_locale_from_params
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  def current_path
    url = request.env["PATH_INFO"]
    Rails.application.routes.recognize_path url
  end

  def layout_by_resource
    if devise_controller? and !organization_user_signed_in?
      'sign_in'
    else
      'application'
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    logger.debug "resource or scope is #{resource_or_scope}"
    if resource_or_scope == :organization_user
      new_organization_user_session_path(locale: I18n.locale)
    elsif resource_or_scope == :admin_user
       new_admin_user_session_path(locale: I18n.locale)
    end
  end

  def after_sign_in_path_for(user)
    logger.debug "User is #{user}, user email #{user.email}"
    if user == current_admin_user
      admin_root_path
    else
      root_path
    end
  end
end
