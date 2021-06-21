# Define your methods here.

def string_map!(str, &b)
    (0...str.length).each do |i|
        str[i] = b.call(str[i])
    end
    str
end

def three?(arr, &b)
    ct = 0
    arr.each { |ele| ct += 1 if b.call(ele) }
    ct == 3
end

def nand_select(arr, p1, p2)
    arr.reject { |ele| p1.call(ele) && p2.call(ele) }
end

def hash_of_array_sum(hash)
    hash.values.inject(0) { |acc, ele| acc + ele.sum }
end

def abbreviate(sen)
    arr = sen.split.map do |w|
        if w.length > 4
            tmp = w.split("").reject { |ch| "aeiou".include?(ch.downcase) }
            tmp.join
        else
            w
        end
    end
    arr.join(" ")
end

def hash_selector(hash, *input)
    res = Hash.new
    if input.empty?
        hash.each { |k, v| res[k] = v }
    else
        hash.each { |k, v| res[k] = v if input.include?(k) }
    end
    res
end
