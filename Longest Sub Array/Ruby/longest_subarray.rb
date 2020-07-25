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
accumulate_sub_array_len = Array.new(input.length)
longest_sub_array_end_index = nil

(0..(input.length-1)).each do |i|
    if i == 0
        if is_even(input[i])
            accumulate_sub_array_len[i] = 1
            longest_sub_array_end_index = i
        else
            accumulate_sub_array_len[i] = 0
        end
    else
        if is_even(input[i])
            accumulate_sub_array_len[i] = accumulate_sub_array_len[i-1] > 0 ? accumulate_sub_array_len[i-1]+1 : 1
            if longest_sub_array_end_index
                longest_sub_array_end_index = accumulate_sub_array_len[i] >= accumulate_sub_array_len[longest_sub_array_end_index] ? i : longest_sub_array_end_index
            else
                longest_sub_array_end_index = i
            end
        else
            accumulate_sub_array_len[i] = 0
        end
    end
end

puts "Length = #{accumulate_sub_array_len[longest_sub_array_end_index]}"
puts "subArr[] = #{input.slice(longest_sub_array_end_index-accumulate_sub_array_len[longest_sub_array_end_index]+1, accumulate_sub_array_len[longest_sub_array_end_index])}"

