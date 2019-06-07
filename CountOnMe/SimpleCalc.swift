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
            if lastElement.contains(".") {
                return false
            }
            for character in operators {
                if lastElement.contains(character) {
                    return false
                }
            }
        } else {
            return false
        }
        return true
    }
    
    // cannot add to operators one after the others
    func canAddOperator() -> Bool {
        if let lastElement = elements.last {
            for character in operators {
                if lastElement.contains(character) {
                    return false
                }
            }
        } else {
            return false
        }
        return true
    }
    
    func addToExpression(_ toAdd: String) {
        
        if expressionHaveResult {
            expression = ""
        }
        
        if toAdd == "." && !canAddComa() {
            return
        }
        
        if operators.contains(toAdd) && !canAddOperator() {
            return
        }
        
        if (operators.contains(toAdd)) {
            expression.append(" ")
        }
        expression.append(toAdd)
        if (operators.contains(toAdd)) {
            expression.append(" ")
        }
    }
    
    // func that sets up arithmetic precedence rules
    func calcResult() -> String {
        
        var iterator = 0
        
        while iterator < elements.count - 1 {
            let element = elements[iterator]
            
            if element == "x" || element == "/" {
                let prevElement = elements[iterator - 1]
                let nextElement = elements[iterator + 1]
                
                var res : Float = 0
                
                if element == "x" {
                    res = Float(prevElement)! * Float(nextElement)!
                } else {
                    res = Float(prevElement)! / Float(nextElement)!
                }
                
                let toReplace = prevElement + " " + element + " " + nextElement
                
                expression = expression.replacingOccurrences(of: toReplace, with: String(res))
                return calcResult()
            }
            iterator += 1
        }
        
        iterator = 0
        
        while iterator < elements.count - 1 {
            let element = elements[iterator]
            
            if element == "+" || element == "-" {
                let prevElement = elements[iterator - 1]
                let nextElement = elements[iterator + 1]
                
                var res : Float = 0
                
                if element == "+" {
                    res = Float(prevElement)! + Float(nextElement)!
                } else {
                    res = Float(prevElement)! - Float(nextElement)!
                }
                
                let toReplace = prevElement + " " + element + " " + nextElement
                
                expression = expression.replacingOccurrences(of: toReplace, with: String(res))
                return calcResult()
            }
            iterator += 1
        }
        return expression
    }
}
