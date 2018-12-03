require 'set'

def find_loop(lines)
  values = lines.map &:to_i

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

def main(filename)
  find_loop(File.open(filename).each_line)
end
