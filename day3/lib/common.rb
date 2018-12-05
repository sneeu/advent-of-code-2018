require 'set'

def parse_line(line)
  /(\d+) @ (\d+),(\d+): (\d+)x(\d+)/.match(line)[1..5].map &:to_i
end

class Grid
  attr_reader :alone

  def initialize(w, h)
    @grid = Array.new(w) { Array.new(h) { Array.new } }
    @alone = Set.new
  end

  def add_cut(id, x, y, w, h)
    @alone.add(id)
    (x..(x + w - 1)).each do |xx|
      (y..(y + h - 1)).each do |yy|
        @grid[xx][yy].push(id)
        if @grid[xx][yy].size > 1 then
          @alone.subtract(@grid[xx][yy])
        end
      end
    end
  end

  def overlaps
    r = 0
    @grid.each do |row|
      row.each do |cell|
        r += 1 if cell.size > 1
      end
    end
    r
  end
end

