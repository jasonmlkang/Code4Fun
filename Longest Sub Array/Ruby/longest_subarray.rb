#! /usr/bin/ruby

# Length of the longest subarray with only even elements

def is_even(val)
    if val == 0
        return false
    else
        return val%2 == 0
    end
end

input = Array.[](5, 2, 4, 7, 6, 18, 14, 0)
len = Array.new(input.length)
longest_sub_array_index = nil
range = (input.length-1)..0
(range.first).downto(range.last).each do |i|
    if i+1 >= len.length
        if is_even(input[i])
            len[i] = 1
            longest_sub_array_index = i
        else
            len[i] = 0
        end
    else
        if is_even(input[i])
            len[i] = len[i+1] > 0 ? len[i+1]+1 : 1
            if longest_sub_array_index
                longest_sub_array_index = len[i] >= len[longest_sub_array_index] ? i : longest_sub_array_index
            else
                longest_sub_array_index = i
            end
        else
            len[i] = 0
        end
    end
end

puts "Length = #{len[longest_sub_array_index]}"
puts "subArr[] = #{input.slice(longest_sub_array_index, len[longest_sub_array_index])}"

