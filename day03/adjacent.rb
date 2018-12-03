class Square
  attr_accessor :id,:left,:top,:width,:height,:string
  def initialize(string)
    md = string.match(/#(\d{1,4})\s\@\s(\d{0,3})\,(\d{0,3}):\s(\d{0,3})x(\d{0,3})/)
    self.string = string
    self.id = md[1].to_i
    self.left = md[2].to_i
    self.top = md[3].to_i
    self.width = md[4].to_i
    self.height = md[5].to_i
    # puts "new square #{md}"
  end
end

squares = Array.new
File.open("input", "r") do |f|
  f.each_line do |line|
    squares.push(Square.new(line.strip))
  end
end

puts "I read #{squares.size} squares."

def how_many_squares_hit(col, row, squares)
  count = 0
  squares.each do |square|
    # puts square.string + "|| #{col} / #{row}"
    # puts (square.left > col)
    # puts (square.top > row)
    # puts (col <= (square.left+square.width) )
    # puts (row <= (square.top+square.height) )
    if ( col > square.left and row > square.top and col <= (square.left+square.width) and row <= (square.top+square.height) )
      # puts square.string + "|| #{col} / #{row}"
      # puts (col > square.left)
      # puts (row > square.top)
      # puts (col <= (square.left+square.width))
      # puts (row <= (square.top+square.height))
      # puts "found intersection"
      count += 1
    end
  end
  count
end

double_plus_hits = Array.new
(1..1000).each do |column|
  (1..1000).each do |row|
    puts "going for #{column},#{row}" if ( column%20 == 0 and row%20 == 0)
    if ( how_many_squares_hit(column,row, squares) >= 2 )
      double_plus_hits.push({col: column, row: row})
      # puts "found double_plus_hit: #{column},#{row}"
    end
  end
end

hit_count = double_plus_hits.length
puts "I counted #{hit_count} double_plus_hits;"
