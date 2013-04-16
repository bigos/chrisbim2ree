module EditablesHelper
  def editable_content(name)
    editable = Editable.where(:name => name).first
    if current_user     
      begin
        edit_link = link_to("Edit", edit_editable_path(editable)) if current_user.username == 'admin'
      rescue
        edit_link = link_to('New', new_editable_path) if current_user.username == 'admin'
      end
    end
    begin
      content = editable.content 
    rescue
      content = "#{h $!}\n<br>probably you need to have some content under name: <strong>#{name}</strong> defined in editables"
    end
    "<div id=\"#{name}\" class=\"editable\">\n#{content}\n</div>#{edit_link}"
  end
end
