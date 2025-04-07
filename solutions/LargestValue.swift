func largestValue(array: [Int], target: Int) -> [Int] {

    var dict = [Int: Int]()
    
    for (index, value) in array.enumerated() {
        let complement = target - value
        if let secondIndex = dict[complement] {
            return [index, secondIndex]
        }
        dict[value] = index
    }
    
    return []
}

//let array = [5, 7, -5, 6, 3, 9, -8, 2, -1, 10]
let array = [-3, 7, -2, 3, 5, -2]
let answer = largestValue(array: array, target: -5)