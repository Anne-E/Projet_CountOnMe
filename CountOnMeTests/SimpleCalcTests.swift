//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

// Test 1 - Deux operateurs ne peuvent pas se suivre
// Test 2 - Un cacul doit comporter deux nombres et un operateur pour être valide
// Test 3 - Tester une addition
// Test 4 - Tester une soustraction
// Test 5 - Tester une division
// Test 6 - Tester une multiplication
// Test 7 - Tester une division par 0
// Test 8 - Tester une addition suivie d'une multiplication (priorité)
// Test 9 - Tester un calcul menant a un résultat trop grand
// Test 10 - Tester que deux virgules ne peuvent pas se suivre
// Test 11 - Tester un calcul menant à un résultat negatif


import XCTest

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
    
        // Use XCTAssertEqual and related functions to verify your tests produce the correct results.
        
        simpleCalc.addToExpression("1")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("+")
        print(simpleCalc.expression)
        XCTAssertEqual(simpleCalc.expression, "1 + ")
    }
    
    func testInvalidOperation1() {
        simpleCalc.addToExpression("1")
        print(simpleCalc.expression)
        XCTAssertEqual(simpleCalc.expressionHaveEnoughElement, false)
    }

    func testInvalidOperation2() {
        simpleCalc.addToExpression("1")
        simpleCalc.addToExpression("+")
        print(simpleCalc.expression)
        XCTAssertEqual(simpleCalc.expressionHaveEnoughElement, false)
    }
    
    func testInvalidOperation3() {
        simpleCalc.addToExpression("33")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("47")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("32")
        print(simpleCalc.expression)
        XCTAssertEqual(simpleCalc.expressionHaveEnoughElement, true)
    }
    
    func testAddition() {
        simpleCalc.addToExpression("5")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("19")
        XCTAssertEqual(simpleCalc.calcResult(), "24.0")
    }
    
    func testSubstraction() {
        simpleCalc.addToExpression("42")
        simpleCalc.addToExpression("-")
        simpleCalc.addToExpression("31")
        XCTAssertEqual(simpleCalc.calcResult(), "11.0")
    }
    func testDivision() {
        simpleCalc.addToExpression("84")
        simpleCalc.addToExpression("/")
        simpleCalc.addToExpression("12")
        XCTAssertEqual(simpleCalc.calcResult(), "7.0")
    }
    func testMultiplication() {
        simpleCalc.addToExpression("112")
        simpleCalc.addToExpression("x")
        simpleCalc.addToExpression("5")
        XCTAssertEqual(simpleCalc.calcResult(), "560.0")
    }
    func testDivisionByNil() {
        simpleCalc.addToExpression("4")
        simpleCalc.addToExpression("/")
        simpleCalc.addToExpression("0")
        XCTAssertEqual(simpleCalc.calcResult(), "Error")
    }
    func testPriorityRules() {
        simpleCalc.addToExpression("4")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("6")
        simpleCalc.addToExpression("x")
        simpleCalc.addToExpression("2")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("5")
        
        XCTAssertEqual(simpleCalc.calcResult(), "21.0")
    }
    
    func testAddComas() {
        simpleCalc.addToExpression(".")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression(".")
        XCTAssertEqual(simpleCalc.calcResult(), "")
    }
    
    func testNegatif() {
        simpleCalc.addToExpression("17")
        simpleCalc.addToExpression("-")
        simpleCalc.addToExpression("22")
        XCTAssertEqual(simpleCalc.calcResult(), "-5.0")
    }
    
    func testOverflow() {
        simpleCalc.addToExpression("999999999999999999999999")
        simpleCalc.addToExpression("x")
        simpleCalc.addToExpression("999999999999999999999999")
        XCTAssertEqual(simpleCalc.calcResult(), "inf")
    }

}
