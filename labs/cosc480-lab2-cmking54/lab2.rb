#
# Problem 1
#

# 1a
class Dessert
    attr_accessor :name, :calories
    def initialize(name, calories)
        @name, @calories = name, calories
    end

    def healthy?
        @calories < 200
    end

    def delicious?
        true
    end
end

# 1b
class JellyBean < Dessert
    attr_accessor :flavor
    def initialize(flavor)
        @flavor, @name, @calories = flavor, "JellyBean", 4
    end

    def delicious? # seems wrong...
        @flavor != "BlackLicorice"
    end
end

#
# Problem 2
#

# 2a
class Numeric
    def perfect_square?
        self == Math.sqrt(self).floor ** 2
    end
end

# 2b
class String
    def to_piglatin
        case self
        when ""
            ""
        when /^[^a-z]?/i
            self[0..-1]
        when /^[aeiou]/i
            self[1..-1] + self[0] + "ay"
        else 
            self + "way" 
        end
    end
end
            
