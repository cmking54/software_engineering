class Meeting < ApplicationRecord
  has_many :registrations
  has_many :people, :through => :registrations

  has_attached_file :image, :styles=> {:medium => "200x200>", :thumb => "100x100>" }, :default_url => "noimg.jpg"
  validates_attachment :image, :content_type => {:content_type => ["image/jpeg", "image/png", "image/gif"]}
  validates_numericality_of :points, on: :create
  validates_inclusion_of :points, :in => [1,2,3,4,5,6,7,8], :allow_nil => true, on: :create

  def is_past?
    # self.date < Date.today
  end

end
