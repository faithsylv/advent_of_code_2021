# input = "forward 5
# down 5
# forward 8
# up 3
# down 8
# forward 2"

input = File.read('inputs/day2.txt')
input_array = input.split("\n").map(&:split)

##Long but more fun?

# class Array
#   def extract
#     return self.last.to_i
#   end
# end

# horizontal = input_array.select{|direction| direction.include?('forward')}
# depth = input_array.difference(horizontal)

# puts horizontal.map(&:extract).sum * depth.map{|direction| direction.first == 'up' ? -direction.last.to_i : direction.last.to_i}.sum

#Boring way?

position = input_array.each_with_object([0,0,0]) do |(direction,value), curr|
  if direction == "forward"
    curr[0] += value.to_i
    curr[2] += value.to_i * curr[1]
  elsif direction == "up"
    curr[1] -= value.to_i
  elsif direction == "down"
    curr[1] += value.to_i
  end
end

p position[0] * position [2]