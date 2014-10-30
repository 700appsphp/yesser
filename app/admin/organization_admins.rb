ActiveAdmin.register OrganizationUser do
  permit_params :id, :email, :password, :password_confirmation,
                :organization_id, :_destroy

  menu priority: 2, url: ->{ admin_organization_users_path(locale: I18n.locale) }, :label => proc{ I18n.t("active_admin.menu.organization_users") }

  index do
    column :email do |org_admin|
      link_to(org_admin.email, [:admin, org_admin])
    end
    column :organization do |org_admin|
      link_to(org_admin.organization.name, [:admin, org_admin.organization])
    end
    column :created_at
    actions
  end


  show do |org_admin|
    attributes_table do
      row :email
      row :organization do
        link_to(org_admin.organization.name, [:admin, org_admin.organization])
      end
      row :sign_in_count
      row :reset_password_sent_at
      row :last_sign_in_at
      row :last_sign_in_ip
      row :created_at
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs I18n.t("organization_users.details") do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :organization
    end
    f.actions
  end

  filter :email
  filter :organization
end
