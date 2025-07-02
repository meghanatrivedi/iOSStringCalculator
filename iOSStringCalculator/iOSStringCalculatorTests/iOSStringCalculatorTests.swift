//
//  iOSStringCalculatorTests.swift
//  iOSStringCalculatorTests
//
//  Created by Meggi on 02/07/25.
//

import XCTest
@testable import iOSStringCalculator

final class iOSStringCalculatorTests: XCTestCase {

    var calculator: StringCalculator!

    override func setUp() {
        super.setUp()
        calculator = StringCalculator()
    }

    override func tearDown() {
        calculator = nil
        super.tearDown()
    }

    // TDD Step 1: Test for an empty string
    func testAdd_EmptyString_ReturnsZero() throws {
        XCTAssertEqual(try calculator.add(""), 0, "Empty string should return 0")
    }

    // TDD Step 2: Test for a single number
    func testAdd_SingleNumber_ReturnsNumber() throws {
        XCTAssertEqual(try calculator.add("1"), 1, "Single number '1' should return 1")
        XCTAssertEqual(try calculator.add("5"), 5, "Single number '5' should return 5")
    }

    // TDD Step 3: Test for two comma-separated numbers
    func testAdd_TwoNumbers_ReturnsSum() throws {
        XCTAssertEqual(try calculator.add("1,5"), 6, "1,5 should return 6")
    }

    // TDD Step 4: Test for multiple comma-separated numbers (any number of inputs)
    func testAdd_MultipleNumbers_ReturnsSum() throws {
        XCTAssertEqual(try calculator.add("1,2,3"), 6, "1,2,3 should return 6")
        XCTAssertEqual(try calculator.add("10,20,30,40"), 100, "10,20,30,40 should return 100")
    }

    // TDD Step 5: Test for new lines between numbers
    func testAdd_NewLinesAsDelimiters_ReturnsSum() throws {
        XCTAssertEqual(try calculator.add("1\n2,3"), 6, "1\\n2,3 should return 6")
        XCTAssertEqual(try calculator.add("1\n2\n3"), 6, "1\\n2\\n3 should return 6")
    }

    // TDD Step 6: Test for custom delimiters
    func testAdd_CustomDelimiter_ReturnsSum() throws {
        XCTAssertEqual(try calculator.add("//;\n1;2"), 3, "Custom delimiter ';' should return 3")
        XCTAssertEqual(try calculator.add("//|\n1|2|3"), 6, "Custom delimiter '|' should return 6")
        XCTAssertEqual(try calculator.add("//$\n1$2$3"), 6, "Custom delimiter '$' should return 6")
    }

    // TDD Step 7: Test for negative numbers (single)
    func testAdd_NegativeNumber_ThrowsException() {
        XCTAssertThrowsError(try calculator.add("-1")) { error in
            XCTAssertEqual(error.localizedDescription, "Negative numbers not allowed: -1")
        }
    }

    // TDD Step 7: Test for multiple negative numbers
    func testAdd_MultipleNegativeNumbers_ThrowsExceptionWithAllNegatives() {
        XCTAssertThrowsError(try calculator.add("1,-2,3,-4")) { error in
            XCTAssertEqual(error.localizedDescription, "Negative numbers not allowed: -2, -4")
        }
    }

    // Edge case: Mixed delimiters with custom
    func testAdd_CustomDelimiterAndNewLines_ReturnsSum() throws {
        XCTAssertEqual(try calculator.add("//;\n1;2\n3"), 6, "Custom delimiter and new lines should work")
    }

    // Edge case: Numbers with leading/trailing whitespace (should be handled by trimming)
    func testAdd_NumbersWithWhitespace_ReturnsSum() throws {
        XCTAssertEqual(try calculator.add(" 1 , 2 \n 3 "), 6, "Numbers with whitespace should be summed correctly")
    }
}
