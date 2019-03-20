class Class
    def attr_accessor_with_history(*attr_names)
        attr_names.each do |attr_name|
            attr_name_str = attr_name.to_s
            class_eval(%Q{def #{attr_name_str}; @#{attr_name_str}; end})
            class_eval(%Q{def #{attr_name_str}=(val); 
                        @#{attr_name_str}_history = [nil] if @#{attr_name_str}.nil?;
                        @#{attr_name_str}_history += [val]; 
                        @#{attr_name_str}=val;
                        end})
            class_eval(%Q{def #{attr_name_str}_history; @#{attr_name_str}_history; end})
        end
    end
end
#class Foo
#    attr_accessor_with_history :bar, :foobar, :barfoo
#end

#f = Foo.new     # => #<Foo:0x127e678>
#puts "**", f.bar_history, "**"
#f.bar = 3       # => 3
#f.bar = :wowzo  # => :wowzo
#f.bar = 'boo!'  # => 'boo!'
#puts f.bar_history # => [nil, 3, :wowzo, 'boo!']
#f.foobar = 'cat'
#f.barfoo = 'dog'
#puts f.foobar_history, f.barfoo_history
