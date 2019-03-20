class NoConversionKnownError < StandardError; end

# part 2a
class Numeric
  @@currencies = {'yen' => 0.0085, 'euro' => 1.15, 'rupee' => 0.016, 'dollar' => 1}

    def method_missing(method_id, *args)
        singular_method_name = method_id.to_s.gsub(/s$/, '').chomp
        puts singular_method_name
        if @@currencies.has_key?(singular_method_name)
            self * @@currencies[singular_method_name]
        elsif singular_method_name == 'in'
            singular_currency = args[0].to_s.gsub(/s$/, '')
            if @@currencies.has_key?(singular_currency)
                self / @@currencies[singular_currency]
            else
                raise NoConversionKnownError
            end
        else
            super
        end
    end
end

#puts 5.dollars.in(:euros) # should be 4.3478
#puts 10.euros.in(:rupees) # should be 718.75
#puts 10.dollars.in(:euros) # should be 8.695
#puts 1000.yen.in(:rupees) # should be 531.25

# part 2b
class String
    def palindrome?
        self.gsub(/\W/, '').downcase == self.gsub(/\W/, '').reverse.downcase
    end
end

#puts "".palindrome?
#puts "do ni@ne MEn int!erp@rwe! nnin!e men! I NOd".palindrome?
#puts "".palindrome?

# part 2c
require 'date'

class DateTime
    @@hours_to_s = {
                0  => 'midnight',
                1  => 'one',
                2  => 'two',
                3  => 'three',
                4  => 'four',
                5  => 'five',
                6  => 'six',
                7  => 'seven',
                8  => 'eight',
                9  => 'nine',
                10 => 'ten',
                11 => 'eleven',
                12 => 'noon' } # semantically correct, but doesn't match example
    @@noon_line = 12
    @@min_in_quarters = {
                0  => '',
                15 => ' a quarter past',
                30 => ' half past',
                45 => ' a quarter til',
                60 => '' }
    @@half_quarter = 8
    @@half_hour = 30
    
    def humanize
        # assuming it has been parsed first
        humanize_min + ' ' + humanize_hr
    end
    def humanize_min
        @@min_in_quarters.each do |quarter, quarter_estimate|
            if self.min < quarter + @@half_quarter
                if self.min == quarter
                    closeness = 'It is' # semantically correct, but doesn't match example
                else
                    closeness = 'About'
                end
                return closeness + quarter_estimate 
            end
        end
    end
    def humanize_hr
        hour = (self.hour + if self.min >= 38 then 1 else 0 end) # carryover added
        hour = hour % @@noon_line unless hour == @@noon_line
        @@hours_to_s[hour]
    end
end

#puts DateTime.parse("10:47 pm").humanize # = > "About a quarter til eleven"
#puts DateTime.parse("10:31 pm").humanize # = > "About half past ten" 
#puts DateTime.parse("10:07 pm").humanize # = > "About ten"
#puts DateTime.parse("23:58").humanize # = > "About midnight" 
#puts DateTime.parse("00:29").humanize #=> "About half past midnight"
#puts DateTime.parse("11:58").humanize #=> "About twelve"
#puts DateTime.parse("12:35").humanize #=> "About half past twelve"

