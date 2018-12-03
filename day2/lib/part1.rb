def counter(enum)
  enum.each_char
      .group_by { |x| x }
      .to_a
      .map { |k, v| [k, v.size] }
      .to_h
end

def frequency(enum)
  counter(enum).select { |k, v| v > 1 }
               .to_a
               .group_by { |k, v| v }
               .keys
end

def checksum(lines)
  lines.flat_map { |l| frequency(l.strip) }
       .group_by { |x| x }
       .to_a
       .map { |k, v| v.size }
       .reduce :*
end

def main(filename)
  checksum(File.open(filename).each_line)
end
