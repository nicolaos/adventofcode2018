
def exactly_two(input_string)
  hash = Hash.new
  input_string.each_char { |char| hash[char] = hash[char] ? hash[char]+1 : 1 }
  hash.select{|k,v| v==2}.any?
end

def exactly_three(input_string)
  hash = Hash.new
  input_string.each_char { |char| hash[char] = hash[char] ? hash[char]+1 : 1 }
  hash.select{|k,v| v==3}.any?
end

lines = []
two_counts = 0
three_counts = 0
File.open("input", "r") do |f|
  f.each_line do |line|
    lines.push(line)
    two_counts += 1 if exactly_two(line)
    three_counts += 1 if exactly_three(line)
  end
end

puts "I read #{lines.size} lines."

checksum = two_counts * three_counts
puts "the input checksum is two_counts(#{two_counts}) * three_counts(#{three_counts}) = #{checksum}"
