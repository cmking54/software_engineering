def combine_anagrams(words)
    hash = Hash.new()
    words.each do |word| 
        key = word.chars.sort(&:casecmp).join
        if hash[key]
            hash[key] << word
        else
            hash[key] = [word]
        end
    end
    return hash.values
end
