//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by TheGIZzz on 26/3/2565 BE.
//

import Foundation
import XCTest

@testable import Bankey

class TestL: XCTestCase {
    var formatter: CurrencyFormatter!
    
    // call once per test
    override func setUp() {
        super.setUp()
    formatter = CurrencyFormatter()
    }
    
    func testShouldBevisible() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "$929,466.23")
    }

    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0.00)
        XCTAssertEqual(result, "$0.00")
    }
}
