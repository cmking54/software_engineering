class RentalProperty < ApplicationRecord
    acts_as_mappable
    def self.filter_on_constraints constraints
        queries = nil
        constraints.each do |k,v|
            case k
            when :bedrooms, :beds, :maxpersons, :bathrooms
                queries = RentalProperty.where("#{k} >= ?", v) unless !queries.nil?
                queries = queries.where("#{k} >= ?", v)
            when :pets_allowed
                queries = RentalProperty.where("#{k} = ?", v) unless !queries.nil?
                queries = queries.where("#{k} = ?", v)
            when :price
                queries = RentalProperty.where("#{k} <= ?", v) unless !queries.nil?
                queries = queries.where("#{k} <= ?", v)
            else
                #logger fatal "Unknown Query Parameter"
            end
        end
        #byebug
        #logger debug queries.join(" AND ")
        return queries unless queries.nil?
        return RentalProperty.none
    end
#puts RentalProperty.where("")
    def distance_from location
        if location.nil? or location[0].nil? or location[0] == 0 or location[1].nil? or location[1] == 0
            return nil 
        end
        self.distance_to location # how does this work?
    end
end
