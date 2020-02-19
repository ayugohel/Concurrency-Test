//
//  ConcurrencyTestTests.swift
//  ConcurrencyTestTests
//


import XCTest
@testable import ConcurrencyTest

class ConcurrencyTests: XCTestCase {
    
    func testloadMessage() {
        
        var msgOne : String?
        var msgTwo : String?
        let expectation = XCTestExpectation(description: "message 1")
        let expectationtwo = XCTestExpectation(description: "message 2")

        fetchMessageOne { (messageOne) in
            msgOne = "Good"
            expectation.fulfill()
        }
        
        fetchMessageTwo { (messageTwo) in
            msgTwo = "morning!"
            expectationtwo.fulfill()
        }
        
        let result = XCTWaiter().wait(for: [expectation,expectationtwo], timeout: 2)
        
        switch result {

        case .completed:
            debugPrint(msgOne! + " " + msgTwo!)
            XCTAssertTrue(result == .completed)

        case .incorrectOrder:
            print("Unexpected order")
            
        case .timedOut:
            debugPrint("Unable to load message - Time out exceeded")
            XCTAssertFalse(result == .timedOut)

            
        default:
            print("There was an issue")
        }
        
//        XCTAssertFalse(result == .timedOut)
        
//        debugPrint(result == .completed ? msgOne + " " + msgTwo : "Unable to load message - Time out exceeded")

    }

}
