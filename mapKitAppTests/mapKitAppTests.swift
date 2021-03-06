//
//  mapKitAppTests.swift
//  mapKitAppTests
//
//  Created by McL on 2/22/19.
//  Copyright © 2019 McL. All rights reserved.
//

import XCTest
@testable import mapKitApp

class mapKitAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testWebRequest() {
        let request = WebRequestImpl(url: "https://google.com", method: .get)
        
        let expectation = self.expectation(description: "WebAccess")
        var remoteResult: Data?
        request.execute { (result) in
            expectation.fulfill()
            remoteResult = result
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(remoteResult != nil)
    }

}
