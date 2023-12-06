def read_input
    File.readlines('time.txt')
end

def part1(lines)
    res = 1
    times = lines[0].split(":")[1].split().map(&:to_i)
    distances = lines[1].split(":")[1].split().map(&:to_i)
    times.each_with_index do |time, x|
        temp = 0
        (0...time).each do |z|
            if (time - z) * z > distances[x]
                temp += 1
            end
        end
        res *= temp
    end
    res
end

def part2(lines)
    time = lines[0].split(":")[1].split().join.to_i
    distance = lines[1].split(":")[1].split().join.to_i
    start, _end = 0, 0
    (0...time).each do |x|
        if (time - x) * x > distance
            start = x
            break
        end
    end
    (time).downto(1) do |x|
        if (time - x) * x > distance
            _end = x
            break
        end
    end
    _end - start + 1
end

lines = read_input
puts "Part1: #{part1(lines)}"
puts "Part2: #{part2(lines)}"