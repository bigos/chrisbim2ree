module ApplicationHelper

  def tagged_count(tag)
    Photo.includes(:tags).where(:tags => {:name => tag.name}).count.to_s
  end

  def tag_li(tag, increase,level, max_level, type, show_count)
    str =  "<li>"
    str << link_to( tag.name + (show_count ? " #{tagged_count( tag)}" : ''), (type == :tags ? tag : photos_path(:tag => tag.name)))
 
    str << recursive_tag_links(tag.name, level+increase, max_level, type, show_count).to_s
    str << "</li>\n"
  end

  def recursive_tag_links(tag_name, level, max_level,type, show_count)
    tag = Tag.where(:name=> tag_name).first
    str = ''
    if tag.children
      if level <= max_level   
        if tag.children.size > 0 
          str << "<ul class=\"depth-#{level}\"> "
          tag.children.sort_by(& :name).each do |tag|
            str << tag_li(tag, 1, level, max_level,type, show_count)
          end
          str << '</ul>'
        end
      end
    end
  end

  def tag_links( max_level = 1000, type = :tags, show_count = false)
    top_tags = Tag.where(:parent_id => nil).order(:name).all
    level = 1
    str = ''    
    str << "<ul class=\"depth-0\">"
    top_tags.each do |tag|
      str << tag_li(tag, 0, level, max_level, type, show_count)
    end
    str << "</ul>"
  end
end
