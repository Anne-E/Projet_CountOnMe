//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

let operators = ["+", "x", "-", "/", "="]

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
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
    
    func calcResult() {
        
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
                
                self.textView.text = self.textView.text.replacingOccurrences(of: toReplace, with: String(res))
                    calcResult()
                    return
                
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
                
                self.textView.text = self.textView.text.replacingOccurrences(of: toReplace, with: String(res))
                calcResult()
                return
                
            }
            iterator += 1
        }
    }
    
    // View actions
    @IBAction func tappedButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if expressionHaveResult {
            textView.text = ""
        }
        
        if numberText == "." && !canAddComa() {
            return
        }
        
        if operators.contains(numberText) && !canAddOperator() {
            return
        }
        
        if numberText == "=" {
            if expressionHaveEnoughElement {
                calcResult()
            }
            else {
                return
            }
        }
        
        if numberText == "AC" {
            textView.text = ""
        } else {
            if (operators.contains(numberText)) {
                textView.text.append(" ")
            }
            textView.text.append(numberText)
            if (operators.contains(numberText)) {
                textView.text.append(" ")
            }
        }
    }
}
