defmodule Main do
    def read_file(file_path) do
        {:ok, data} = File.read(file_path)
        String.split(data, "\n")
    end

    def calculate(dots, blocks, dot_index, block_index, current_count, memoization) do
        key = {dot_index, block_index, current_count}
        case Map.get(memoization, key) do
            nil ->
                if dot_index == String.length(dots) do
                    if block_index == length(blocks) and current_count == 0 do
                        1
                    else
                        0
                    end
                else
                    result = Enum.reduce(['.', '#'], 0, fn char, acc ->
                        if String.at(dots, dot_index) == char or String.at(dots, dot_index) == "?" do
                            if char == '.' and current_count == 0 do
                                acc + calculate(dots, blocks, dot_index + 1, block_index, 0, memoization)
                            elif char == '.' and current_count > 0 and block_index < length(blocks) and Enum.at(blocks, block_index) == current_count do
                                acc + calculate(dots, blocks, dot_index + 1, block_index + 1, 0, memoization)
                            elif char == '#' do
                                acc + calculate(dots, blocks, dot_index + 1, block_index, current_count + 1, memoization)
                            else
                                acc
                            end
                        else
                            acc
                        end
                    end)
                    Map.put(memoization, key, result)
                    result
                end
            result -> result
        end
    end

    def main(file_path) do
        lines = read_file(file_path)
        for is_part2 <- [false, true] do
            total = Enum.reduce(lines, 0, fn line, acc ->
                [dots, blocks] = String.split(line)
                if is_part2 do
                    dots = Enum.join([dots, dots, dots, dots, dots], "?")
                    blocks = Enum.join([blocks, blocks, blocks, blocks, blocks], ",")
                end
                blocks = Enum.map(String.split(blocks, ","), &String.to_integer/1)
                memoization = %{}
                score = calculate(dots, blocks, 0, 0, 0, memoization)
                acc + score
            end)
            IO.puts(total)
        end
    end
end

Main.main("input.txt")
