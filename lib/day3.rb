input_array = File.read('inputs/day3.txt').split("\n")

counts = input_array.each_with_object({1 => [0,0], 
                                     2 => [0,0], 
                                     3 => [0,0], 
                                     4 => [0,0], 
                                     5 => [0,0], 
                                     6 => [0,0],
                                     7 => [0,0],
                                     8 => [0,0],
                                     9 => [0,0],
                                     10 => [0,0],
                                     11 => [0,0],
                                     12 => [0,0]
                                     }) do |curr_binary_num, counts| 

  curr_binary_num.split('').each_with_index do |num, i|
    num.to_i == 0 ? counts[i+1][0] += 1 : counts[i+1][1] += 1
  end
end

gamma = counts.map{|k,(a,b)| a > b ? 0 : 1}.join().to_i(2)
epsilon = counts.map{|k,(a,b)| a < b ? 0 : 1}.join().to_i(2)

p gamma * epsilon