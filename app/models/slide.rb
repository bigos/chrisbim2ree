class Slide < ActiveRecord::Base
  attr_accessible :caption, :position, :visible, :photo
  
  has_attached_file :photo, :styles => { :thumb => "190x90>" }
 
  validates_presence_of :caption

  def reorder_positions!
    slides= Slide.where(:visible => true).order :position
    pos = 0
    slides.each do |slide|
      slide.position = pos += 1
      slide.save
    end
  end

  def toggle_visibility!
    if self.visible
      self.visible = false
      self.position = nil
    else
      self.visible = true
      self.position = Slide.where(:visible => true).count + 1
    end
    self.save
    reorder_positions!
  end
end
