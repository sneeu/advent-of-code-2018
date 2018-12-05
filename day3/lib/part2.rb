require_relative './common'

def alone(lines, w, h)
  g = Grid.new(w, h)

  lines.each do |line|
    g.add_cut(*parse_line(line))
  end

  g.alone.first
end

def main(filename)
  alone(File.open(filename).each_line, 1000, 1000)
end

