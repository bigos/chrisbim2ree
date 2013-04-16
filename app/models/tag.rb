class Tag < ActiveRecord::Base
  attr_accessible :name, :parent_id
  
  has_many :taggings
  has_many :photos, :through => :taggings
  belongs_to :photo

  has_many :children, :class_name => "Tag", :foreign_key => "parent_id", :dependent => :nullify
  belongs_to :parent, :class_name => "Tag"
  
  validates :name, :presence => true, :uniqueness => {:scope => :parent_id}
  validate :parent_can_not_be_self

  def parent_can_not_be_self
    if self.parent_id and self.parent_id == self.id
      errors.add(:parent_id, "can't be parent of itself")
    end
  end

  def photo_count
    self.photos.count
  end

  def recursive_children
    kids = []
    kids << self
    #p self
    self.children.each do |child|
      kids << child.recursive_children
    end
    kids
  end

  def set_parent!(tag)
    self.parent_id = tag.id
    self.save
  end
end
