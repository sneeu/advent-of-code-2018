def main(filename)
  File.open(filename) { |f| (f.each_line.map &:to_i).reduce :+ }
end

puts main('input')
