class Product < ApplicationRecord
    def age_range
        if self.minimum_age_appropriate.nil? and self.maximum_age_appropriate.nil?
            return "0 and above"
        elsif self.maximum_age_appropriate.nil?
            return "#{self.minimum_age_appropriate} and above"
        end
        if !self.minimum_age_appropriate.nil? and !self.maximum_age_appropriate.nil?
            if self.minimum_age_appropriate == self.maximum_age_appropriate
                return "Age #{self.minimum_age_appropriate}"
            else
                return "#{self.minimum_age_appropriate} to #{self.maximum_age_appropriate}"
            end
        end
    end
    def self.sorted_by field
        if Product.column_names.include? field
            Product.order(field)
        elsif field =~ %r{age}
            Product.order("minimum_age_appropriate")
        else
            Product.order("name")
        end
    end 
end
