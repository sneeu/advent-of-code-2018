def scalpel(line, n)
  line.slice(0, n) + line.slice(n + 1, line.size)
end

def grouper(lines, index)
  lines.map do |l|
    { scalpel(l, index) => [l] }
  end
    .reduce { |a, b| a.merge(b) { |_k, o, n| o + n } }

end

def distances(lines)
  (0..(lines[0].size - 1)).flat_map do |index|
    grouper(lines, index)
      .select { |k, vs| vs.size > 1 }
      .keys
  end
end

def main(filename)
  distances(File.open(filename).readlines)
end
