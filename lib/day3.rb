input = '00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010'

input_array = File.read('inputs/day3.txt').split("\n")
# File.read('inputs/day3.txt')

def get_count(binary_num_array)
  binary_num_array.each_with_object(Hash.new { |hash, key| hash[key] = [0,0]}) do |curr_binary_num, counts| 
    curr_binary_num.split('').each_with_index do |num, i|
      num.to_i == 0 ? counts[i][0] += 1 : counts[i][1] += 1
    end
  end
end

#part 1
gamma = get_count(input_array).map{|k,(a,b)| a > b ? 0 : 1}.join().to_i(2)
epsilon = get_count(input_array).map{|k,(a,b)| a < b ? 0 : 1}.join().to_i(2)

p gamma * epsilon

# part2
def find_chemical_rating(binary_num_array, index, chemical)

  if binary_num_array.size == 1
    return binary_num_array[0].to_i(2)
  end

  indexed_counts = get_count(binary_num_array)[index].each_with_index
  matching_bit = chemical == 'oxygen' ? indexed_counts.max[1] : indexed_counts.min[1]
  filtered_array = binary_num_array.filter{|binary_num| binary_num.split('')[index].to_i == matching_bit}

  find_chemical_rating(filtered_array, index + 1, chemical)
end

oxygen_generator_rating = find_chemical_rating(input_array, 0, 'oxygen')
c02_scrubber_rating = find_chemical_rating(input_array, 0, 'c02')

p oxygen_generator_rating * c02_scrubber_rating