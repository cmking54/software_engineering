class Product < ApplicationRecord
  has_many :reviews
  has_many :customers, :through => :reviews
  scope :with_rating, -> (average_rating) {joins(:reviews).group(:product_id).having("AVG(reviews.stars) >= ?", average_rating)}
  def age_range
    minage = self.minimum_age_appropriate || "0"
    maxage = self.maximum_age_appropriate ? "to #{self.maximum_age_appropriate}" : "and above"
    if self.minimum_age_appropriate && self.minimum_age_appropriate == self.maximum_age_appropriate
      return "Age #{minage}"
    else
      return "#{minage} #{maxage}"
    end
  end

  def age_appropriate?(age)
    if self.minimum_age_appropriate
      if self.maximum_age_appropriate
         return age >= self.minimum_age_appropriate && age <= self.maximum_age_appropriate
      else
         return age >= self.minimum_age_appropriate
      end
    else
      return true
    end
  end

  def self.sorted_by(field)
    field = field || "name"
    field = field.to_s
    if field == "age"
      field = "minimum_age_appropriate"
    end
    field = "name" unless Product.column_names.include?(field)
    Product.order(field)
  end    

    def average_rating
        self.reviews.average(:stars)
    end
end
