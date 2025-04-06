// Problem: https://www.hackerrank.com/challenges/arrays-ds/problem

func reverseArray(a: [Int]) -> [Int] {

    var left = 0, right = a.count - 1
    var reverseArray = a
    
    while left < right {
        reverseArray[left] = a[right]
        reverseArray[right] = a[left]
        left += 1
        right -= 1
    }
    
    return reverseArray
}