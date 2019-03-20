class RentalProperty < ApplicationRecord
  acts_as_mappable
  has_attached_file :image, :styles=> {:medium => "300x300>", :thumb => "100x100>" }, :default_url => "noimg.png"
  validates_attachment :image, :content_type => {:content_type => ["image/jpeg", "image/png", "image/gif"]}

  def self.filter_on_constraints(constraint_hash, location)
    records = RentalProperty.all
    operator_hash = {
        :bedrooms => '>=',
        :beds => '>=',
        :maxpersons => '>=',
        :bathrooms => '>=',
        :pets_allowed => '==',
        :price => '<=',
    }
    constraint_hash.each_pair do |symbol, value|
        if value != ""
            symbol = symbol.to_sym
            value = value.to_sym
            operator = operator_hash[symbol]
            if !operator.nil?
                records = records.where("#{symbol.to_s} #{operator} ?", value)
            elsif symbol == :distance
                if (constraint_hash[:address].nil? or constraint_hash[:address] == '') and !location.nil?
                    records = records.within(value.to_s.to_i, :origin => location)
                else
                    geo = Geokit::Geocoders::MultiGeocoder.geocode(constraint_hash[:address].to_s)
                    if geo.success
                        records = records.within(value.to_s.to_i, :origin => [geo.lat, geo.lng])
                    end 
                end
            end
        end
    end
    records
  end

  def distance_from(location)
      return nil if location.nil? 
      return  distance_to(location)
  end
end
