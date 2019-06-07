//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    var simpleCalc: SimpleCalc = SimpleCalc()
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Updqte UI and Logic expression
    func updateExpression(_ newExpression: String) {
        textView.text = newExpression
        simpleCalc.expression = newExpression
    }
    
    // Func that manages all the buttons of the calculator
    @IBAction func tappedButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if numberText == "=" {
            if simpleCalc.expressionHaveEnoughElement {
                updateExpression(simpleCalc.calcResult())
            }
            else {
                return
            }
        }
        
        if numberText == "AC" {
            updateExpression("")
        } else {
            simpleCalc.addToExpression(numberText)
            updateExpression(simpleCalc.expression)
        }
    }
}
