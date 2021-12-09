puts 'hello'

# input = %(199
# 200
# 208
# 210
# 200
# 207
# 240
# 269
# 260
# 263)

input = File.read('day1.txt')

input_array = input.split("\n").map( &:to_i )

# puts input_array.each_cons(2).select{|(a,b)| b > a}.size

puts input_array.each_cons(3).map{|array| array.sum }.each_cons(2).select{|(a,b)| b > a}.size
# if you want to print each tuple --> each {|item| puts item.to_s + "\n"}
