file_path = File.expand_path("../input.txt", __FILE__)
# file_path = File.expand_path("../sample", __FILE__)
input     = File.read(file_path)

items = input.split.map(&:to_i)

def recursive_call rec_items
  # puts "remaining #{rec_items.join(' ')}"
  puts "remaining #{rec_items.size}"
  child_num, metadata_num = rec_items.shift(2).map(&:to_i)
  # puts "child_num:#{child_num}//metadata_num:#{metadata_num}//acc:#{acc}"
  acc = 0

  child_weights = {}
  child_num.times do |index|
    child_weights[index+1] = recursive_call(rec_items)
  end

  medatatas = rec_items.shift(metadata_num)

  medatatas.each do |metadata_child|
    acc = acc + child_weights[metadata_child] if (child_weights[metadata_child])
  end
  acc = acc + medatatas.sum if (child_num==0)

  acc
end

accumulator = recursive_call items
puts accumulator
