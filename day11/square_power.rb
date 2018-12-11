magic_num = 1309
# magic_num = 8

def coord_power x, y, magic_num
  (((((x + 10) * y) + magic_num) * (x + 10)).div(100).to_i % 10) -5
end

# puts coord_power 3, 5, magic_num
power_grid = {}
1..300.times do |x|
  1..300.times do |y|
    power_grid["#{x}-#{y}"] = coord_power x, y, magic_num
  end
end

square_grid = {}
1..298.times do |x|
  1..298.times do |y|
    acc = 0
    (x..x+2).each do |cx|
      (y..y+2).each do |cy|
        acc = acc + power_grid["#{cx}-#{cy}"]
      end
    end
    square_grid["#{x}-#{y}"] = acc
  end
end

puts square_grid.max_by{ |k,v| v }

