class Sight < ApplicationRecord
  has_many :comments
  has_many :photos
  has_many :up_down_votes
  has_many :users, :through => :up_down_votes
  scope :by_upvotes, -> { order("count_upvote DESC").joins(:up_down_votes).where("upvote = ?", true).group("sights.id").select("count(upvote) as count_upvote, sights.*") }
  scope :no_votes, -> { includes(:up_down_votes).where(:up_down_votes => { :sight_id => nil }) }

  def upvotes
    self.up_down_votes.where("upvote = ?", true).count
  end

  def downvotes
    self.up_down_votes.where("upvote = ?", false).count
  end

  def random_photo
    self.photos.order("RANDOM()").first
  end
end
