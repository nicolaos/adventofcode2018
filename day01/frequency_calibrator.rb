
lines = []
File.open("input", "r") do |f|
  f.each_line do |line|
    lines.push(line.to_i)
  end
end

puts "I read #{lines.size} lines."

current_frequency = 0
idx = 0
hash = Hash.new
hash[current_frequency] = hash[current_frequency] ? hash[current_frequency]+1 : 1
while hash[current_frequency] < 2
  current_frequency = current_frequency + lines[idx]
  hash[current_frequency] = hash[current_frequency] ? hash[current_frequency]+1 : 1

  if ( idx == lines.size-1 )
    idx = 0
    puts "one more round... #{current_frequency}"
  else
    idx = idx + 1
  end
end

puts "I found that #{current_frequency} has been passed #{hash[current_frequency]} of times."
puts current_frequency
