class Person < ApplicationRecord
  has_many :registrations
  has_many :meetings, :through => :registrations

  devise :omniauthable

  has_attached_file :image, :styles=> {:medium => "300x300>", :thumb => "100x100>" }, :default_url => "no_photo.png"
  validates_attachment :image, :content_type => {:content_type => ["image/jpeg", "image/png", "image/gif"]}

  scope :rank1, lambda { where('points >= ?', 14).order("points").reverse_order}
  scope :rank2, lambda { where('points >= ? AND points < ?', 10, 14).order("points").reverse_order}
  scope :rank3, lambda { where('points >= ? AND points < ?', 6, 10).order("points").reverse_order}

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |person|
      person.provider = auth.provider
      person.uid = auth.uid
      person.first_name = auth.info.name.to_s.split(' ')[0]
      person.last_name = auth.info.name.to_s.split(' ')[1]
      person.oauth_token = auth.credentials.token
      person.oauth_expires_at = Time.at(auth.credentials.expires_at)
      person.save!
    end
  end


end
