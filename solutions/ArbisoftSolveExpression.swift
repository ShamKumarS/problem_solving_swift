/*
 * Complete the 'solveExpression' function below.
 *
 * The function is expected to return a DOUBLE.
 * The function accepts STRING expression as parameter.
 */

// case 1: 2 + 3 * 4 should return 20 does not follow BODMAS rule
// case 2: evalue brackets and follow case 1

func solveExpression(expression: String) -> Double {
    let tokens = tokenize(expression: expression)
    var values: [Double] = []
    var operators: [String] = []
    var index = 0
    
    while index < tokens.count {
        let token = tokens[index]
        
        if let number = Double(token) {
            values.append(number)
        } else if token == "(" {
            operators.append(token)
        } else if token == ")" {
            while operators.last != "(" {
                let number2 = values.removeLast()
                let number1 = values.removeLast()
                let operation = operators.removeLast()
                let result = performOperation(operation, number1, number2)
                values.append(result)
            }
            
            operators.removeLast()
        } else if ["+", "-", "*", "/"].contains(token) {
            operators.append(token)
        }
        
        index += 1
    }
    
    while !operators.isEmpty {
        let number1 = values.removeFirst()
        let number2 = values.removeFirst()
        let operation = operators.removeFirst()
        let result = performOperation(operation, number1, number2)
        values.append(result)
    }
    
    return values.last ?? 0
} 

func tokenize(expression: String) -> [String] {
    var tokens: [String] = []
    var currentToken = ""
    
    for char in expression {
        if char.isWhitespace { continue }
        
        if char.wholeNumberValue != nil {
            currentToken.append(char)
        } else {
            if !currentToken.isEmpty {
                tokens.append(currentToken)
                currentToken = ""
            }
            tokens.append(String(char))
        }
    }
    
    if !currentToken.isEmpty {
        tokens.append(currentToken)
    }
    
    return tokens
}

func performOperation(_ operation: String, _ number1: Double, _ number2: Double) -> Double {
    switch operation {
        case "+":
            return number1 + number2
        case "-":
            return number1 - number2
        case "*":
            return number1 * number2
        case "/":
            return number1 / number2
        default:
            print("Operator not supported.")
            return 0
    }
}
