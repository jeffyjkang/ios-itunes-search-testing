//
//  SearchResultControllerTests.swift
//  iTunes SearchTests
//
//  Created by Jeff Kang on 2/4/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import XCTest

@testable import iTunes_Search

class SearchResultControllerTests: XCTestCase {
    
    // Dependency Injection = you provide the instance variables that an object or method uses
    
    // Type fo Dependency Injection
    // 1. Initializer Dependency Injection - Creating an object with data in the init method
    // 2. Property Dependency Injection - passing a model objext to a detail controller
    // 3. Method Dependency Injection - provide a completion closure or method
    
    func testForSomeResults() {
        let controller = SearchResultController()
        
        let expect = expectation(description: "Wait fo results")
        
        controller.performSearch(for: "DayOne", resultType: .software) {
//            XCTFail()
            expect.fulfill()
        }
        wait(for: [expect], timeout: 2)
        
        XCTAssertTrue(controller.searchResults.count > 0, "Expecting at least one result for Day One")
    }
    
    func testSearchResultController() {
        let mock = MockDataLoader()
        mock.data = dayOneJSON
        
        let controller = SearchResultController(dataLoader: mock)
        let resultsExpectation = expectation(description: "Wait for search results")
        
        controller.performSearch(for: "DayOne", resultType: .software) {
            resultsExpectation.fulfill()
        }
        
        wait(for: [resultsExpectation], timeout: 2.0)
        
        XCTAssert(controller.searchResults.count == 2, "Expecting 2 results for DayOne")
        XCTAssertEqual("Bloom Built Inc", controller.searchResults[0].artist)
        XCTAssertEqual("Day One Journal", controller.searchResults[0].title)
    }
    
    func testBadJsonDecodingReturnsError() {
        let mock = MockDataLoader()
        mock.data = badJSON
        
        let controller = SearchResultController(dataLoader: mock)
        let resultsExpectation = expectation(description: "Wait for search results")
        
        controller.performSearch(for: "DayOne", resultType: .software) {
            resultsExpectation.fulfill()
        }
        
        wait(for: [resultsExpectation], timeout: 2.0)
        XCTAssertTrue(controller.searchResults.count == 0, "Expecting no results for search")
        XCTAssertNotNil(controller.error)
    }
    
    func testNoResults() {
        let mock = MockDataLoader()
        mock.data = noResults
        
        let controller = SearchResultController(dataLoader: mock)
        let resultsExpectation = expectation(description: "Wait for search results")
        
        controller.performSearch(for: "abc123", resultType: .software) {
            resultsExpectation.fulfill()
        }
        
        wait(for: [resultsExpectation], timeout: 2.0)
        XCTAssertTrue(controller.searchResults.count == 0, "Expecting no results from empty JSON")
    }

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
