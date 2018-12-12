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

25.times do |side|
  puts "computing... #{side}"

  1..(301-side).times do |x|
    1..(301-side).times do |y|
      acc = 0

      if ( side-1 > 0)
        (x..(x+side-1)).each do |cx|
          acc = acc + power_grid["#{cx}-#{(y+side-1)}"]
        end
        (y..(y+side-1)).each do |cy|
          acc = acc + power_grid["#{(x+side-1)}-#{cy}"]
        end
        acc = acc + square_grid["#{x}-#{y}-#{side-1}"]
      else
        acc = power_grid["#{x}-#{y}"]
      end
      square_grid["#{x}-#{y}-#{side}"] = acc
    end
  end

end

puts square_grid.max_by{ |k,v| v }

