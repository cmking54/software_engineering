class Meeting < ApplicationRecord
  has_many :registrations
  has_many :people, :through => :registrations

  has_attached_file :image, :styles=> {:medium => "200x200>", :thumb => "100x100>" }, :default_url => "noimg.jpg"
  validates_attachment :image, :content_type => {:content_type => ["image/jpeg", "image/png", "image/gif"]}

  def is_past?
    self.date < Date.today
  end

end
