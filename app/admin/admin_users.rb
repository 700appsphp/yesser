ActiveAdmin.register AdminUser do
  menu priority: 3, url: ->{ admin_admin_users_path(locale: I18n.locale) }, :label => proc{ I18n.t("active_admin.menu.admin_users") }
  permit_params :email, :password, :password_confirmation
  # actions :all, except: [:destroy]
  config.batch_actions = false

  config.action_items.delete_if { |item|
    # item is an ActiveAdmin::ActionItem
    item.display_on?(:show)
  }

  index do
    column :email do |admin|
      link_to admin.email, [:admin, admin]
    end
    column :last_sign_in_at
    column :sign_in_count
    column :created_at
    column do |admin|
      links = ''.html_safe
      if controller.action_methods.include?('show') && authorized?(ActiveAdmin::Auth::READ, admin)
        links << link_to(I18n.t('active_admin.view'), resource_path(admin), class: 'member_link view_link')
      end
      if controller.action_methods.include?('edit') && authorized?(ActiveAdmin::Auth::UPDATE, admin)
        links << link_to(I18n.t('active_admin.edit'), edit_resource_path(admin), class: 'member_link edit_link')
      end
      if controller.action_methods.include?('destroy') && authorized?(ActiveAdmin::Auth::DESTROY, admin) && admin != current_admin_user
        links << link_to(I18n.t('active_admin.delete'), resource_path(admin), class: 'member_link delete_link',
          method: :delete, data: {confirm: I18n.t('active_admin.delete_confirmation')})
      end
      links
    end
  end

  action_item :only => :show do
    links = "".html_safe
    links << link_to(I18n.t('active_admin.edit_model', model: active_admin_config.resource_label), edit_resource_path(resource))
    if current_admin_user != resource
      links << link_to(I18n.t('active_admin.delete_model', model: active_admin_config.resource_label), resource_path(resource),
              method: :delete, data: {confirm: I18n.t('active_admin.delete_confirmation')})
    end
    links
  end

  show do |admin|
    attributes_table do
      row :email
      row :last_sign_in_at
      row :sign_in_count
      row :last_sign_in_ip
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs I18n.t("active_admin.admin_details") do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  filter :email
  filter :last_sign_in_at, label: Proc.new{ I18n.t("active_admin.last_sign_in_filter") }
  filter :created_at, label: Proc.new{ I18n.t("active_admin.created_at_filter") }
end
