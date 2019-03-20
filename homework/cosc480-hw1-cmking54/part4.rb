# part a
class Car
    @@total_cars = 0
    @@make_directory = Hash.new
    attr_accessor :model, :year
    attr_reader :make
    def initialize(name, model=nil, year=nil)
        @make, @model, @year = name, model, year
        @@total_cars += 1
        add_to_make_dir(name)
    end

    def add_to_make_dir(value)
        if @@make_directory[value]
            @@make_directory[value] += 1
        else
            @@make_directory[value] = 1
        end
    end
    private :add_to_make_dir

    def make=(value) # doesn't this change the 'make directory'?
        if @@make_directory[@make] == 1
            # delete @@make_directory[@make]
            add_to_make_dir(value)
        else
            @@make_directory[@make] -= 1 # does this work?
            add_to_make_dir(value)
        end        
        @make = value 
    end

    def self.num_cars_made
        @@total_cars
    end

    def self.most_popular_make # need return?
        ret = []
        max = @@make_directory.values.max
        @@make_directory.each do |k, v|
            if v == max
                ret << k
            end
        end
        ret
    end

    def self.been_made?(car_make) # need return?
        @@make_directory[car_make] != nil
    end
end


# part b

class PostcodeLocation
    attr_reader :name, :postcode, :latitude, :longitude
    def initialize(name, postcode, latitude, longitude)
        @name, @postcode, @latitude, @longitude = name, postcode, latitude, longitude
    end

    def to_s
        "#{@name} (#{@postcode}) at (#{@latitude}, #{@longitude})"
    end

    def distance_to(other, unit=:kilometers)
        dlat = to_radians(other.latitude) - to_radians(@latitude)
        dlon = to_radians(other.longitude) - to_radians(@longitude)
        a = Math.sin(dlat/2) ** 2
        b = Math.cos(to_radians(@latitude))
        b = b * Math.cos(to_radians(other.latitude))
        b = b * Math.sin(dlon/2) ** 2
        c = 2 * Math.asin(Math.sqrt(a + b))
        if unit == :kilometers then return 6378 * c else return 3959 * c end
    end

    def to_radians(degree)
        return (degree.to_f/180)*Math::PI
    end
    private :to_radians
end

# part c
class UKPostcodes
    @@name_hash, @@pc_hash = Hash.new(Array.new), Hash.new(Array.new)
    def initialize
    end
    def self.load(filename='postcodes.csv')
        File.open(filename) do |file|
            file.each_line do |line|
                add_to_index(line.chomp) unless line =~ /^#/
            end
        end
    end
    def self.add_to_index(str)
        info = parse(str)
        curr_obj = PostcodeLocation.new(info[0], info[1], info[2], info[3])
        @@name_hash[info[0]] += [curr_obj]
        @@pc_hash[info[1]] += [curr_obj]
    end
    def self.parse(str)
        broke = str.split(/,/s)
        [broke[1].gsub(/\"/, ""), broke[0], broke[7], broke[8]]
    end
    def self.find_by_name(str)
        return find(str, :name)
    end
    def self.find_by_postcode(str)
        return find(str, :postcode)
    end
    def self.find(str, type)
        regex = %r{} 
        ret = []
        hash = Hash.new
        case type
        when :name
            hash = @@name_hash
            regex = %r{#{str}}i
        when :postcode
            hash = @@pc_hash
            regex = %r{^#{str}}i
        end
        hash.each_key do |k|
            if k =~ regex
                hash[k].each do |p|
                    ret += [p]
                end
            end
        end
        return ret
    end
    #private :add_to_index, :parse, :find
end  

# code that was used to generate output shown in homework description.
# uncomment when you're ready to test.
#
 UKPostcodes.load
 puts "Find by name (OnD):"
 puts UKPostcodes.find_by_name('OnD')
puts
 puts "Find by name (llan):"
 puts UKPostcodes.find_by_name('llan')
puts
 puts "Find by postcode (C):"
 puts UKPostcodes.find_by_postcode('C')
puts
 puts "Find by postcode (ox):"
 puts UKPostcodes.find_by_postcode('ox')
puts
 puts "Find by postcode (x):"
 puts UKPostcodes.find_by_postcode('x')
puts
 
 oxford = UKPostcodes.find_by_postcode('OX').shift
puts oxford
 cardiff = UKPostcodes.find_by_postcode('CF').shift
puts cardiff
 puts "Oxford to Cardiff is #{(oxford.distance_to cardiff, :miles).round 2} miles or #{(oxford.distance_to cardiff, :kilometers).round 2} km" 
