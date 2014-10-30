def get_name_symbol
  if I18n.locale.to_s == "ar"
    :arabic_name
  else
    :english_name
  end
end

ActiveAdmin.register City do
  menu priority: 4, url: ->{ admin_cities_path(locale: I18n.locale) }, :label => proc{ I18n.t("active_admin.menu.cities") }
  # active_admin_import :validate => false,
  #                     :csv_options => {:col_sep => "," },
  #                     :before_import => proc{ City.delete_all},
  #                     :batch_size => 1000

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :arabic_name, :english_name, :longitude, :latitude
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
  show title: get_name_symbol do |city|
    attributes_table do
      row :arabic_name
      row :english_name
      row :longitude
      row :latitude
    end
  end
end

