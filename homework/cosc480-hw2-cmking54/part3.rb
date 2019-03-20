# part a
class CartesianProduct
    include Enumerable
    def initialize *lists
#        @counter = []
#        lists.each {@counter << 0}
        @lists = lists
    end
    def each
        @lists[0].product(*@lists[1..-1]) { |e| yield e }
    end 
#    def each2
#        @lists.map {|l| l.length }.inject(:*).times do 
#            ret = []
#            carry_over = 1
#            (0...@lists.length).each do |i| 
#                ret << @lists[i][@counter[@counter.length - 1 - i]]
#            end
#            yield ret
#            (0...@lists.length).each do |i|
#                if carry_over > 0
#                    if @counter[i] + carry_over == @lists[@lists.length - 1 - i].length
#                        @counter[i] = 0
#                    else
#                        @counter[i] += 1
#                        carry_over = 0
#                    end
#                end
#            end
#        end
#    end  
end

# Examples of use
#c = CartesianProduct.new([:a,:b], [4,5])
#c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]


#c = CartesianProduct.new([:a,:b], [])
#c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product of anything with an empty collection is empty)

#c = CartesianProduct.new([], [:a,:b])
#c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product of anything with an empty collection is empty)

# part b
class BinaryTree
    #include Enumerable
    def initialize val=nil
        @less, @more = nil, nil
        @val = val unless val.nil?
#        puts "here by const #{val}" unless val.nil?
    end
    def << val
        if @val.nil?
            @val = val
#            puts "here #{val}"
        elsif val < @val
#            puts "left #{val} < #{@val}"
            if @less.nil?
                @less = BinaryTree.new val
            else
                @less << val
            end
        elsif val > @val
#            puts "right #{val} > #{@val}"
            if @more.nil?
                @more = BinaryTree.new val
            else
                @more << val
            end
        end
    end
    def empty? # might be called on less or more which can be null
        @less.nil? and @val.nil? and @more.nil?
    end
    def each &p
        @less.each &p unless @less.nil?
        p.call @val unless @val.nil?
        @more.each &p unless @more.nil?
    end
end

#b = BinaryTree.new
#puts b.empty? #true
#(Array.new(10) {rand(1..100)}).each {|i| b << i}
#puts b.empty? #false
#b.each {|n| if n.nil? then puts 'nil' else puts n end}
