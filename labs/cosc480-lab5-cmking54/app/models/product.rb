class Product < ApplicationRecord
  def age_range
    minage = self.minimum_age_appropriate || "0"
    maxage = self.maximum_age_appropriate ? "to #{self.maximum_age_appropriate}" : "and above"
    if self.minimum_age_appropriate && self.minimum_age_appropriate == self.maximum_age_appropriate
      return "Age #{minage}"
    else
      return "#{minage} #{maxage}"
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

end
