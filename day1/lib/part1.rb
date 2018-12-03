def sum_lines(lines)
  (lines.map &:to_i).reduce :+
end

def main(filename)
  sum_lines(File.open(filename).each_line)
end
