using DelimitedFiles, Regex

const GEAR = "*"
const input = "engine.txt"
const directions = [(1, 0), (0, 1), (-1, 0), (0, -1), (1, 1), (-1, -1), (1, -1), (-1, 1)]

is_valid_pos(pos, grid) = all([1 <= pos[i] <= size(grid, i) for i in 1:2])

function search_for_symbol(curr_number, grid, gear_locations)
    number = join([char_and_pos[1] for char_and_pos in curr_number])
    for char_and_pos in curr_number
        pos = (char_and_pos[2], char_and_pos[3])
        for direction in directions
            poss_pos = (pos[1] + direction[1], pos[2] + direction[2])
            if is_valid_pos(poss_pos, grid) && occursin(r"[^\w.]", grid[poss_pos...]) && grid[poss_pos...] == GEAR
                gear_locations[poss_pos] = push!(get(gear_locations, poss_pos, []), parse(Int, number))
                return true
            end
        end
    end
    return false
end

function find_sum_part_numbers()
    curr_number = []
    part_numbers = []
    gear_locations = Dict()
    grid = readdlm(input, String)
    for i in 1:size(grid, 1), j in 1:size(grid, 2)
        char = grid[i, j]
        if isdigit(char)
            push!(curr_number, [char, i, j])
        elseif search_for_symbol(curr_number, grid, gear_locations)
            push!(part_numbers, curr_number)
            curr_number = []
        end
    end
    sum = sum(parse(Int, join([char_and_pos[1] for char_and_pos in chars_and_pos])) for chars_and_pos in part_numbers)
    gear_sum = sum(prod(numbers) for (gear_location, numbers) in gear_locations if length(numbers) == 2)
    return [sum, gear_sum]
end

println(find_sum_part_numbers())