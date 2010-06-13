# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title(title)
    content_for(:title, title)
    return title
  end

  def menu_link(name, pretty_name, url)
    link_to_if(params[:controller] == name, pretty_name, url, :class => "active") do
      link_to pretty_name, url
    end
  end

  def menu_link_admin(name)
    if params[:controller] == "admin/#{name}"
      "current"
    else
      ""
    end
  end

end
