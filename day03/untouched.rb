class Square
  attr_accessor :id,:left,:top,:width,:height,:string,:covered
  def initialize(string)
    md = string.match(/#(\d{1,4})\s\@\s(\d{0,3})\,(\d{0,3}):\s(\d{0,3})x(\d{0,3})/)
    self.string = string
    self.id = md[1].to_i
    self.left = md[2].to_i
    self.top = md[3].to_i
    self.width = md[4].to_i
    self.height = md[5].to_i
    self.covered = covered_points
    # puts "new square #{md}"
  end

  def covered_points
    covered = []
    (left..(left+width)).each do |x|
      (top..(top+height)).each do |y|
        covered.push("#{x}-#{y}")
      end
    end
    covered
  end
end

squares = Array.new
covered_points_ids = Hash.new
File.open("input", "r") do |f|
  f.each_line do |line|
    square = Square.new(line.strip)
    squares.push(square)
    square.covered.each do |covered_point|
      covered_points_ids[covered_point] = covered_points_ids[covered_point] ? covered_points_ids[covered_point] << square.id : [square.id]
    end
  end
end

puts "I read #{squares.size} squares."

puts "I collected #{covered_points_ids.keys.length} points hitted."

puts "Examples ids:"
key = covered_points_ids.keys.sample
puts key
example = covered_points_ids[key]
example.each do |id|
  puts id
end

squares.each do |square|
  alone = true
  square.covered.each do |point|
    alone = alone && covered_points_ids[point].size == 1
  end
  puts "#{square.id} is alone." if (alone == true)
end
