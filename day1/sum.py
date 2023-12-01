total = 0

with open('input.txt', 'r') as file:
    for line in file:
        line = line.strip()
        if line:
            first_digit = next(char for char in line if char.isdigit())
            last_digit = next(char for char in reversed(line) if char.isdigit())
            total += int(first_digit + last_digit)

print(total)