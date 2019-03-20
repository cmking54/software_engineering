# problem 1
module Enumerable
    def chain &p
        self.each do |elt|
            if elt.is_a? Enumerable
                elt.chain &p
            else
                p.call elt
            end
        end
    end
end
#arr = []
#[ 1, [2, 3], [4, [5, 6] ] ].chain do |x|
#    arr << x ** 2
#end
#puts "#{arr}"

# problem 2
class Time
    def method_missing(method_id, *args)
        change = {'min' => 0, 'hour' => 1, 'day' => 2, 'month' => 3, 'year' => 4}
        to = {'min' => 0, 'hour' => 0, 'day' => 0, 'month' => 1, 'year' => 1}
         
        if method_id.to_s =~ /^at_beginning_of_(\w+)$/
            new_time = self.to_a
            raise NoMethodError unless change[$1]
            new_time[change[$1]] = to[$1]
            Time.local(*new_time)
        else
            super #args
        end
    end
end
#puts Time.now #=> 2018-02-11 10:15:59 -0500 
#puts Time.now.at_beginning_of_min #=> 2018-02-11 10:16:00 -0500
#puts Time.now.at_beginning_of_hour #=> 2018-02-11 10:00:07 -0500
#puts Time.now.at_beginning_of_day #=> 2018-02-11 00:16:03 -0500
#puts Time.now.at_beginning_of_month #=> 2018-02-01 10:16:11 -0500
#puts Time.now.at_beginning_of_year #=> 2018-01-11 10:16:12 -0500
#puts Time.now.at_beginning_of_min.at_beginning_of_day.at_beginning_of_month #=> 2018-02-01 00:16:00 -0500
#puts Time.now.at_beginning_of_min.at_beginning_of_day.at_beginning_of_month.at_beginning_of_year.at_beginning_of_hour #=> 2018-01-01 00:00:00 -0500   
