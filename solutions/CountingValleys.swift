// Problem Link: https://www.hackerrank.com/challenges/counting-valleys/problem

// Solution
func countingValleys(steps: Int, path: String) -> Int {
    var seaLevel = 0
    var numberOfValleys = 0
    var inValley = false

    for step in path {
        seaLevel = step == "U" ? seaLevel + 1 : seaLevel - 1

        if seaLevel < 0 && !inValley {
            inValley = true
        } else if seaLevel == 0 && inValley {
            numberOfValleys += 1
            inValley = false
        }
    }
    
    return numberOfValleys
}

print("Valleys = \(countingValleys(steps: 8, path: "UDDDUDUU"))")
