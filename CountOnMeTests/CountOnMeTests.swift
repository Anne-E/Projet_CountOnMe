//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Anne-Elisabeth on 02/08/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

// Test 1 - Can't add 2 operators together
// Test 2 - A calcul needs at least two numbers and one operator
// Test 3 - valid operation test
// Test 4 - Addition test
// Test 4 - substraction test
// Test 5 - division test
// Test 6 - multiplication test
// Test 7 - division by 0
// Test 8 - arithmetic priority rules test
// Test 9 - can't type 2 comas next to the other
// Test 10 - negative result test
// Test 11 - overflow test


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
        
        simpleCalc.addToExpression("1")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("+")
        XCTAssertEqual(simpleCalc.expression, "1 + ")
    }
    
    func testInvalidOperation1() {
        simpleCalc.addToExpression("1")
        XCTAssertEqual(simpleCalc.expressionHaveEnoughElement, false)
    }
    
    func testInvalidOperation2() {
        simpleCalc.addToExpression("1")
        simpleCalc.addToExpression("+")
        XCTAssertEqual(simpleCalc.expressionHaveEnoughElement, false)
    }
    
    func testValidOperation3() {
        simpleCalc.addToExpression("33")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("47")
        simpleCalc.addToExpression("+")
        simpleCalc.addToExpression("32")
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
