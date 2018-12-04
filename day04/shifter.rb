require 'date'

class NightEvent
  attr_accessor :string,:time,:guard,:is_asleep,:is_awake
  def initialize(string)
    ev_string = string.match(/\[(.*)\]\s(falls|wakes|Guard)(\s\#(\d*))?/)
    self.string = string
    self.time = DateTime.parse(ev_string[1])
    self.is_asleep = (ev_string[2] == 'falls')
    self.is_awake = (ev_string[2] == 'wakes')
    if (ev_string[2] == 'Guard')
      self.guard = ev_string[4]
    end
  end

end

night_events = []
File.open("input", "r") do |f|
  f.each_line do |line|
    night_events << NightEvent.new(line.strip)
  end
end


night_events.take(10).each do |event|
  puts "--------"
  puts event.string
  puts event.time
  puts event.is_asleep
  puts event.is_awake
  puts event.guard
end
