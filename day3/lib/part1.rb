require_relative './common'

def overlaps(lines, w, h)
  g = Grid.new(w, h)

  lines.each do |line|
    g.add_cut(*parse_line(line))
  end

  g.overlaps
end

def main(filename)
  overlaps(File.open(filename).each_line, 1000, 1000)
end

