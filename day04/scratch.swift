import Foundation

func calculatePoints(fromFile file: String) -> Int {
    guard let content = try? String(contentsOfFile: file) else {
        print("File not found.")
        return 0
    }
    
    let lines = content.components(separatedBy: "\n")
    var matches = [Int]()
    for line in lines {
        let parts = line.components(separatedBy: "|")
        guard parts.count == 2 else { continue }
        
        let winningNumbers = Set(parts[0].split(separator: " ").compactMap { Int($0) }.dropFirst(2))
        let yourNumbers = Set(parts[1].split(separator: " ").compactMap(Int.init))
        
        matches.append(winningNumbers.intersection(yourNumbers).count)
    }
    
    var cards = Array(repeating: 1, count: matches.count)
    for (i, n) in matches.enumerated() {
        for j in 0..<n {
            if i + j + 1 < cards.count {
                cards[i + j + 1] += cards[i]
            }
        }
    }
    
    let totalPoints = matches.filter { $0 > 0 }.reduce(0) { $0 + (1 << ($1 - 1)) }
    let totalCards = cards.reduce(0, +)
    
    print("Total points: \(totalPoints)")
    print("Total cards: \(totalCards)")
    
    return totalPoints
}

calculatePoints(fromFile: "scratchcard.txt")