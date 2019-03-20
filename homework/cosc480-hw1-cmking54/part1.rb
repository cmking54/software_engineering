# part a
def palindrome?(string)
    return pal_check?(pal_normalize(get_words(string)))
end

def pal_normalize(words)
    return words.join('').downcase
end

def pal_check?(str)
    for i in 0..str.length/2
        if str[i] != str[str.length-i-1]
            return false
        end
    end
    return true
end

# part b
def count_words(string)
    ret = Hash.new
    get_words(string).each do |word|
        word = word.downcase
        if ret[word]
            ret[word] += 1
        else
            ret[word] = 1
        end
    end
    return ret
end

def get_words(str)
    return str.scan(/\b\w+\b/i)
end

# part c
def date_string_to_day_seconds(string)
    time = date_normalize(string)
    return get_secs_from_midnight_24h(time[0], time[1], time[2])
end

def date_normalize(str)
    str.match(/(\d+):(\d+):(\d+)\D?(.*)\b/i)
    new_1 = $1
    if $4.downcase == 'pm'
        new_1 = ($1.to_i + 12).to_s
    end
    return [new_1, $2, $3, $4]
end

def get_secs_from_midnight_24h(hour, min, sec)
    return (hour.to_i * 3600) + (min.to_i * 60) + (sec.to_i)
end
