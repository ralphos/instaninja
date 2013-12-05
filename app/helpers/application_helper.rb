module ApplicationHelper
  def nav_link(link_text, link_path)
    #class_name = current_page?(link_path) ? 'active' : ''

    if current_page?(link_path) && link_path == hashtags_path
      class_name = 'active-hashtags'
    elsif current_page?(link_path) && link_path == user_likes_path
      class_name = 'active-user-likes'
    elsif current_page?(link_path) && link_path  == user_commenters_path
      class_name = 'active-user-commenters'
    end

    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end

  def capitalize(name)
    name.split.map(&:capitalize).join(' ')
  end
end
