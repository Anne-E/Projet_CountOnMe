//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet var numberButtons: [UIButton]!
    
    var simpleCalc: SimpleCalc = SimpleCalc()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.adjustsFontSizeToFitWidth = true
    }
    
    // Update UI and Logic expression
    func updateExpression(_ newExpression: String) {
        label.text = newExpression
        simpleCalc.expression = newExpression
    }
    
    // Func that manages all the buttons of the calculator
    @IBAction func tappedButton(_ sender: UIButton) {
        guard let numberText: String = sender.title(for: .normal) else {
            return
        }
        
        if numberText == "%" {
            updateExpression(simpleCalc.calcResultPercent())
            return
        }
        
        if numberText == "=" {
            if simpleCalc.expressionHaveEnoughElement {
                updateExpression(simpleCalc.calcResult())
                return
            }
            else {
                return
            }
        }
        
        if numberText == "AC" {
            updateExpression("")
            return
        }
        
        simpleCalc.addToExpression(numberText)
        updateExpression(simpleCalc.expression)
    }
}
