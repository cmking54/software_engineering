#
# Problem 1
#
def strip_tags(s)
    puts(s.match(/<.*>(.*)<.*>/i))
end

#
# Problem 2
#
def starts_with_consonant?(s)
    return (s =~ /^[^aeiou]/) != nil
end
