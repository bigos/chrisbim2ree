
def find_tag_or_create(tag_name)
  tag = Tag.where(:name => tag_name).first
  unless tag 
    tag = Tag.new(:name => tag_name)
    tag.save
  end
  tag
end

def set_parent(child_name, parent_name)
  child = find_tag_or_create(child_name)
  parent = find_tag_or_create(parent_name)
  child.set_parent! parent
end

def set_up_tags
  # add tags that are in a relashioship tree
  rels = {'England' => ['Cornwall', 'Dorset', 'Devon', 'Wiltshire', 
                         'Lancashire', 'Greater Manchester'],
          'Greater Manchester' => ['City Centre', 'Salford Quays'],
          'Scotland' => ['Glen Coe', 'Isle of Skye'],
          'Wales' => ['Glamorgan', 'Breacon Beacons'],
          'Italy' => ['Venice'],
          'Nature' => ['Birds','Insects','Deer'],
          'Insects' => ['Odonata'],
          'Odonata' => ['Dragonflies', 'Damselflies']}  
  rels.each do |parent, children| 
    children.each do |child|
      puts 'Setting ' + parent + ' as parent of: ' + child
      set_parent child, parent
    end
  end    
  # add tags that are not in a tree
  categories = ['Landscape', 'Seascape', 'Architecture', 'Travel', 
                'Ephemera', 'Night', 'Black & White']
  categories.each do |category|
    puts "Adding: " + category
    find_tag_or_create(category)
  end
end

namespace :tag_hierarchy do
  desc 'Set up tag hierarchy'
  task :set_up_tags => :environment do
    set_up_tags
  end
end
