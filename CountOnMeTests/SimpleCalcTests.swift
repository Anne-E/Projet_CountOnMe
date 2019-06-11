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
// Test 11 - Tester un calcul menant un résultat negatif


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
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        simpleCalc.addToExpression("1")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("+")
        print(simpleCalc.expression)
        XCTAssert(simpleCalc.expression == "1 + ")
    }
    
    func testInvalidOperation1() {
        simpleCalc.addToExpression("1")
        print(simpleCalc.expression)
        XCTAssert(!simpleCalc.expressionHaveEnoughElement)
    }

    func testInvalidOperation2() {
        simpleCalc.addToExpression("1")
        simpleCalc.addToExpression("+")
        print(simpleCalc.expression)
        XCTAssert(!simpleCalc.expressionHaveEnoughElement)
    }
    
    func testInvalidOperation3() {
        simpleCalc.addToExpression("1")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("1")
        print(simpleCalc.expression)
        XCTAssert(simpleCalc.expressionHaveEnoughElement)
    }
    
    func testAddition() {
        simpleCalc.addToExpression("1")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("1")
        XCTAssert(simpleCalc.calcResult() == "2.0")
    }
    
    func testSubstraction() {
        simpleCalc.addToExpression("1")
        simpleCalc.addToExpression("-")
        simpleCalc.addToExpression("1")
        XCTAssert(simpleCalc.calcResult() == "0.0")
    }
    func testDivision() {
        simpleCalc.addToExpression("2")
        simpleCalc.addToExpression("/")
        simpleCalc.addToExpression("2")
        XCTAssert(simpleCalc.calcResult() == "1.0")
    }
    func testMultiplication() {
        simpleCalc.addToExpression("2")
        simpleCalc.addToExpression("x")
        simpleCalc.addToExpression("2")
        XCTAssert(simpleCalc.calcResult() == "4.0")
    }
    func testDivisionByNil() {
        simpleCalc.addToExpression("4")
        simpleCalc.addToExpression("/")
        simpleCalc.addToExpression("0")
        XCTAssert(simpleCalc.calcResult() == "inf")
    }
    func testPriorityRules() {
        simpleCalc.addToExpression("2")
        simpleCalc.addToExpression("x")
        simpleCalc.addToExpression("4")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("2")
        XCTAssert(simpleCalc.calcResult() == "10.0")
    }
    
    func testAddComas() {
        simpleCalc.addToExpression(".")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression(".")
        XCTAssert(simpleCalc.calcResult() == "")
    }
    
    func testNegatif() {
        simpleCalc.addToExpression("1")
        simpleCalc.addToExpression("-")
        simpleCalc.addToExpression("2")
        XCTAssert(simpleCalc.calcResult() == "-1.0")
    }
    
    func testOverflow() {
        simpleCalc.addToExpression("999999999999999999999999")
        simpleCalc.addToExpression("x")
        simpleCalc.addToExpression("999999999999999999999999")
        XCTAssert(simpleCalc.calcResult() == "inf")
    }

}
