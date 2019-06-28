//
//  SimpleCalc.swift
//  CountOnMe
//
//  Created by Anne-Elisabeth on 07/06/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class SimpleCalc {
    
    let operators = ["+", "x", "-", "/", "="]
    
    var expression: String = ""
    
    var elements: [String] {
        return expression.split(separator: " ").map { "\($0)" }
    }
    
    // To check that an operation have at leat 3 elements
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    // To allow a new operation after a result
    var expressionHaveResult: Bool {
        return expression.firstIndex(of: "=") != nil
    }
    
    
    
    // cannot add two comas one after the other or if the last element is a coma
    func canAddComa() -> Bool {
        if let lastElement = elements.last {
            return !lastElement.contains(".") || !operators.contains(lastElement)
        }
        return true
    }
    
    // cannot add two operators one after the other
    func canAddOperator() -> Bool {
        if let lastElement = elements.last {
            return !operators.contains(lastElement)
        }
        return true
    }
    
    func addToExpression(_ toAdd: String) {
        
        var add = toAdd
        
        // We check if it's an operator
        
        let isOperator = operators.contains(toAdd)
        
        // If a result is displayed then reset for the next operation
        
        if expressionHaveResult {
            expression = ""
        }
        
        // if we try to add a coma but it is not possible -> return
        
        if toAdd == "." && !canAddComa() {
            return
        }
        
        // if we try to add an operator but it is not possible -> return
        
        if isOperator && !canAddOperator() {
            return
        }
        
        // when we type an operator we add a space before and after
        
        if isOperator {
            add = " " + add + " "
        }
        
        // add the input
        
        expression.append(add)
    }
    
    // func to calc with a percentage
    func calcResultPercent() -> String {
        if self.expressionHaveEnoughElement {
            _ = calcResult()
        }
        if let operand1 = Float(expression),
            let operand2 = Float("100.0") {
            let result = operand1 / operand2
            self.expression = String(result)
        }
        return expression
    }
    
    // func that sets up arithmetic precedence rules
    func calcResult() -> String {
        _ = calcPriorityOperator()
        _ = calcOtherOperator()
        return expression
    }
}

// Extension to calculate all the operations

private extension SimpleCalc {
    
    private func calcPriorityOperator() -> String {
        var iterator = 0
        
        while iterator < elements.count - 1 {
            let element = elements[iterator]
            if element == "/" {
               return divide(position: iterator)
            } else if element == "x" {
                return multiply(position: iterator)
            }
            iterator += 1
        }
        return ""
    }
    
    private func calcOtherOperator() -> String {
        var iterator = 0
        
        while iterator < elements.count - 1 {
            let element = elements[iterator]
            
            if element == "+" {
                return add(position: iterator)
            } else if element == "-" {
                return sub(position: iterator)
            }
            iterator += 1
        }
        return expression
    }
}

// Extension to calculate for each operator

private extension SimpleCalc {
    private func multiply(position: Int) -> String {
        if let (operand1, operand2) = getOperand(position: position) {
            applyResult(position: position, res: operand1 * operand2)
            return calcResult()
        }
        return "Error"
    }
    
    private func divide(position: Int) -> String {
        if let (operand1, operand2) = getOperand(position: position) {
            if operand2 == 0 {
                expression = "Error"
            } else {
                applyResult(position: position, res: operand1 / operand2)
                return calcResult()
            }
        }
        
        return "Error"
    }
    
    private func add(position: Int) -> String {
        if let (operand1, operand2) = getOperand(position: position) {
            applyResult(position: position, res: operand1 + operand2)
            return calcResult()
        }
        return "Error"
    }
    
    private func sub(position: Int) -> String {
        if let (operand1, operand2) = getOperand(position: position) {
            applyResult(position: position, res: operand1 - operand2)
            return calcResult()
        }
        return "Error"
    }
}

// Extension to get the operand and to apply a result

private extension SimpleCalc {
    private func getOperand(position: Int) -> (Float, Float)? {
        let prevElement = elements[position - 1]
        let nextElement = elements[position + 1]
        
        if let elem1 = Float(prevElement),
           let elem2 = Float(nextElement) {
            return (elem1, elem2)
        } else {
            return nil
        }
    }
    
    private func applyResult(position: Int, res: Float) {
        let prevElement = elements[position - 1]
        let element = elements[position]
        let nextElement = elements[position + 1]
        
        let toReplace = prevElement + " " + element + " " + nextElement
        
        expression = expression.replacingOccurrences(of: toReplace, with: String(res))
    }
}
