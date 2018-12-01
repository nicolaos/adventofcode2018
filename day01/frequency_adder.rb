
accumulator = 0
File.open("input", "r") do |f|
  f.each_line do |line|
    puts accumulator
    accumulator = accumulator + line.to_i
  end
end

puts "final frequency="
puts accumulator
