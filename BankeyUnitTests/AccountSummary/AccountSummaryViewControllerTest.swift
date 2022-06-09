//
//  AccountSummaryViewControllerTest.swift
//  BankeyUnitTests
//
//  Created by TheGIZzz on 9/6/2565 BE.
//

import Foundation
import XCTest

@testable import Bankey

class AccountSummaryViewControllerTest: XCTestCase {
    var vc: AccountSummaryViewController!
    
    override func setUp() {
        super.setUp()
        vc = AccountSummaryViewController()
    }
    
    func testTitleAndMessageForServerError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .serverError)
        XCTAssertEqual("Server Error", titleAndMessage.0)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again.", titleAndMessage.1)
    }
    
    func testTitleAndMessageForDecodedError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .decodingError)
        XCTAssertEqual("Decoding Error", titleAndMessage.0)
        XCTAssertEqual("We could not process your request. Please try again.", titleAndMessage.1)
    }
    
}
