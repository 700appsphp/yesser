ActiveAdmin.register Organization do
  permit_params :id, :name, :description, \
    organization_users_attributes: [:id, :email, :password, :password_confirmation, 
                                    :_destroy],
    apps_attributes: [:id, :name, :url, :platform, :description, :image, :_destroy]

  menu priority: 1, url: ->{ admin_organizations_path(locale: I18n.locale) }, :label => proc{ I18n.t("active_admin.menu.organizations") }


  index label: "Organizations" do
    column :name do |organization|
      link_to organization.name, [:admin, organization]
    end
    column :created_at
    actions
  end

  show do |org|
    attributes_table do
      row :name
      row :description
      row :admins do
        if org.organization_users.blank?
          div do
            span class: "empty" do I18n.t('active_admin.empty') end
          end
        end
        org.organization_users.each do |org_admin|
          div do
            link_to(org_admin.email, [:admin, org_admin])
          end
        end
      end
      row :apps do
        if org.apps.blank?
          div do
            span class: "empty" do I18n.t('active_admin.empty') end
          end
        end
        org.apps.each do |app|
          div class: "panel" do
            h3(I18n.t("organizations.app_details")) +
            div(class: "attributes_table") do
              table(cellspacing: 0, cellpadding: 0, border: 0) do
                tr class: "row" do
                  th(I18n.t("helpers.labels.name")) +
                  td(app.name)
                end
                tr class: "row" do
                  th(I18n.t("helpers.labels.description")) +
                  td(app.description)
                end
                tr class: "row" do
                  th(I18n.t("helpers.labels.url")) +
                  td(app.url)
                end
                tr class: "row" do
                  th(I18n.t("helpers.labels.platform")) +
                  td(app.platform)
                end
                tr class: "row" do
                  th(I18n.t("helpers.labels.image")) +
                  td(image_tag app.image_url)
                end
              end
            end
          end
        end
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs I18n.t("organizations.details") do
      f.input :name
      f.input :description, input_html: {rows: 4}
    end

    f.inputs I18n.t("organizations.app_list") do
      f.has_many :apps, allow_destroy: true, heading: t("organizations.app_details") do |cf|
        cf.input :name
        cf.input :description
        cf.input :url, label: I18n.t('activerecord.attributes.app.url')
        cf.input :platform, as: :select, collection: ["IOS", "Android", "Windows Phone"]
        cf.input(:image, as: :file) +
        image_tag(cf.object.image_url(:thumb).to_s, class: "thumb app_image")
      end
    end
    f.actions
  end

  config.sort_order = "name_asc"
  config.per_page = 20
  filter :name
  filter :created_at, label: Proc.new{ I18n.t("active_admin.created_at_filter") }
end
