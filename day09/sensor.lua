local file = io.open('sensor.txt', 'r')
local totalExtrapolatedValues = 0
local totalExtrapolatedValuesBackwards = 0

for line in file:lines() do
    local sequence = {}
    for num in string.gmatch(line, "%S+") do
        table.insert(sequence, tonumber(num))
    end
    local sequences = {sequence}

    while #sequence > 0 and sequence[1] ~= 0 do
        local diffSequence = {}
        for i = 1, #sequence - 1 do
            table.insert(diffSequence, sequence[i + 1] - sequence[i])
        end
        table.insert(sequences, diffSequence)
        sequence = diffSequence
    end

    table.insert(sequences[#sequences], 1, 0)
    table.insert(sequences[#sequences], 0)

    for i = #sequences - 1, 1, -1 do
        table.insert(sequences[i], 1, sequences[i][1] - sequences[i + 1][1])
        table.insert(sequences[i], sequences[i][#sequences[i]] + sequences[i + 1][#sequences[i + 1]])
    end

    totalExtrapolatedValuesBackwards = totalExtrapolatedValuesBackwards + sequences[1][1]
    totalExtrapolatedValues = totalExtrapolatedValues + sequences[1][#sequences[1]]
end

print(totalExtrapolatedValues)
print(totalExtrapolatedValuesBackwards)

file:close()