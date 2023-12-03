def sum_part_numbers(schematic):
    total = 0
    symbols = {'*', '#', '+', '$'}
    rows, cols = len(schematic), len(schematic[0])
    for i in range(rows):
        for j in range(cols):
            if schematic[i][j].isdigit():
                for di in range(-1, 2):
                    for dj in range(-1, 2):
                        ni, nj = i + di, j + dj
                        if 0 <= ni < rows and 0 <= nj < cols and schematic[ni][nj] in symbols:
                            total += int(schematic[i][j])
                            break
    return total

def read_schematic(filename):
    with open(filename, 'r') as file:
        lines = file.readlines()
    return [list(line.strip()) for line in lines]

schematic = read_schematic("engine.txt")
print(sum_part_numbers(schematic))