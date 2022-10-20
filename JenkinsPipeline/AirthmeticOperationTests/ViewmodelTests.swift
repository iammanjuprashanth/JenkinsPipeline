//
//  ViewmodelTests.swift
//  AirthmeticOperationTests
//
//  Created by manjuprashanth s on 01/09/22.
//

import XCTest
@testable import AirthmeticOperation

class ViewmodelTests: XCTestCase {

    var viewmodel: Addition?
    override func setUpWithError() throws {
        viewmodel = Addition()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        viewmodel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdd() {
        XCTAssertEqual(viewmodel?.add(number1: 2, number2: 2), 4, "Should be equal to 4")
    }
}
