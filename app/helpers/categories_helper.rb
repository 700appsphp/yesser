module CategoriesHelper

  def nested_categories(categories, partial_name, moving_state, form_object)
    categories.map do |category, sub_categories|
      content_tag(:li, class: "treeview") do
        render(partial_name, cat: category, move: moving_state, f: form_object) + 
        content_tag(:ul, nested_categories(sub_categories, partial_name, 
                    moving_state, form_object), 
                    class: "nested_categories treeview-menu")
      end
    end.join.html_safe
  end
end
