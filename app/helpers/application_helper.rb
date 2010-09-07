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

  def current_page
    current_page = request.path_info.sub('/','')
  end

  def class_if_current(path = '')
    %q(class = 'current') if current_page == path
  end

  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
  end

end
