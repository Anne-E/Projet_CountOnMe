//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

// Test 1 - Deux operateurs ne peuvent pas se suivre
// Test 2 - Un cacule doit compoter deux nombres et un operateur pour être valide
// Test 3 - Tester une addition
// Test 4 - Tester une soustraction
// Test 5 - Tester une division
// Test 6 - Tester une multiplication
// Test 7 - Tester une devision par 0
// Test 8 - Tester une addition suivie d'une multiplication (priorité)
// Test 9 - Tester un calcul menant a un resultat trop grand

// Test 10 - Tester qu'un nombre ne puisse pas comporter deux fois de virgule
// Test 11 - Tester un calcul menant un resultat negatif


import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {
    
    var simpleCalc: SimpleCalc = SimpleCalc()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        simpleCalc = SimpleCalc()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDoubleOperator() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        simpleCalc.addToExpression("1")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("+")
        
        XCTAssert(simpleCalc.expression == "1 + ")
    }

}
