ActiveAdmin.register_page "Dashboard" do

  # menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  menu false

  content title: proc{ I18n.t("active_admin.dashboard") } do
    panel t("organizations.plural") do
      section  do
        table_for Organization.all, :class => "index_table" do
          column I18n.t('activerecord.attributes.organization.name') do |organization|
            link_to(organization.name, [:admin, organization])
          end
          column I18n.t('activerecord.attributes.organization.created_at') do |organization|
            I18n.l(organization.created_at, format: :long)
          end
        end
        strong { link_to I18n.t("helpers.titles.view_all", 
          model: t("organizations.plural")), admin_organizations_path }
    end
  end

  end
end
