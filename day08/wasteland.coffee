fs = require 'fs'
mathjs = require 'mathjs'

data = fs.readFileSync('wasteland.txt', 'utf8').trim().split '\n\n'
instructions = data[0].split '\n'
rest = data[1].split '\n'

nodes = {}
for line in rest
    [key, value] = line.split(' = ')
    nodes[key] = value[1..-2].split(', ')

traverse_p1 = (start, end) ->
    i = steps = 0
    while start != end
        i = 0 if i == instructions.length
        start = if instructions[i] == 'L' then nodes[start][0] else nodes[start][1]
        steps++
        i++
    steps

part1 = traverse_p1 'AAA', 'ZZZ'
console.log part1

traverse_p2 = (start) ->
    i = steps = 0
    while not start.endsWith 'Z'
        i = 0 if i == instructions.length
        start = if instructions[i] == 'L' then nodes[start][0] else nodes[start][1]
        steps++
        i++
    steps

starts = (start for start of nodes when start.endsWith 'A')
part2 = 1
for start in starts
    part2 = mathjs.lcm part2, traverse_p2(start)
console.log part2