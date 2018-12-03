
def equal_chars(line, second_line)
  similars = ""
  line.chars.each_with_index do |char, index|
    similars+=char if ( char == second_line[index] )
  end
  similars
end

lines = []
File.open("input", "r") do |f|
  f.each_line do |line|
    lines.push(line)
  end
end

puts "I read #{lines.size} lines."

similar_string = ""
similar_line_1 = nil
similar_line_2 = nil
lines.each do |line|
  lines.each do |second_line|
    equals = equal_chars(line.strip, second_line.strip)
    if ( equals.length == (line.strip.length - 1) )
      similar_string = equals
      similar_line_1 = line.strip
      similar_line_2 = second_line.strip
      puts "found match:"
      puts similar_string
      puts "for lines:"
      puts similar_line_1
      puts similar_line_2
    end
  end
end

puts "the similar chars are:"
puts similar_string
puts "for lines:"
puts similar_line_1
puts similar_line_2
