SIZE = 300

serial = ARGV.first&.to_i || 1309

power = (0..SIZE).map { |y|
  (0..SIZE).map { |x|
    rack = x + 10
    my_power = (rack * y + serial) * rack
    my_power = (my_power / 100) % 10
    my_power - 5
  }.freeze
}.freeze

valid3 = (1..(SIZE - 2)).to_a

puts valid3.product(valid3).max_by { |x, y|
  power[y, 3].sum { |row| row[x, 3].sum }
}.join(?,)

# https://en.wikipedia.org/wiki/Summed-area_table
# sum[y][x] reports the sum of all points above and to the left of (y, x).
sum = Array.new(SIZE) { Array.new(SIZE).unshift(0) }
sum.unshift([0] * (SIZE + 1))

(1..SIZE).each { |y|
  (1..SIZE).each { |x|
    sum[y][x] = power[y][x] + sum[y - 1][x] + sum[y][x - 1] - sum[y - 1][x - 1]
  }
}

maxp = 0
maxc = []

(1..SIZE).each { |sidelen|
  valid = (1..(SIZE + 1 - sidelen))
  valid.each { |ymin|
    ymax = ymin + sidelen - 1
    ymins = sum[ymin - 1]
    ymaxes = sum[ymax]
    valid.each { |xmin|
      xmax = xmin + sidelen - 1

      power_here = ymaxes[xmax] - ymins[xmax] - ymaxes[xmin - 1] + ymins[xmin - 1]
      if power_here > maxp
        maxp = power_here
        maxc = [xmin, ymin, sidelen]
      end
    }
  }
}

puts maxc.join(?,)