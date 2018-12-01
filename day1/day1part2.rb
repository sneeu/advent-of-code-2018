require 'set'

def main(filename)
  values = File.open(filename).each_line.map &:to_i

  totals = Set.new
  running = 0
  index = 0

  while true do
    n = values[index % values.size]
    running += n
    if totals.include? running then
      break
    end
    totals.add(running)
    index += 1
  end

  running
end

puts main('input')
