total = 0
word_dict = {
    "one": "onee",
    "two": "twoo",
    "three": "three",
    "four": "fourr",
    "five": "fivee",
    "six": "sixx",
    "seven": "sevenn",
    "eight": "eightt",
    "nine": "ninee",
}

word_num_dict = {
    "one": "1",
    "two": "2",
    "thre": "3",
    "four": "4",
    "five": "5",
    "six": "6",
    "seven": "7",
    "eight": "8",
    "nine": "9",
}

with open("input.txt", "r") as f:
    for line in f:
        line = line.strip()
        for word, num in word_dict.items():
            line = line.replace(word, num)
        for word, num in word_num_dict.items():
            line = line.replace(word, num)
        if line:
            first_digit = next(char for char in line if char.isdigit())
            last_digit = next(char for char in reversed(line) if char.isdigit())
            total += int(first_digit + last_digit)

print(total)
