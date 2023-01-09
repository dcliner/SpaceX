//
//  SpaceXListTestsCases.swift
//  SpaceXListTestsCases
//
//  Created by Derefaa Cline on 1/6/23.
//

import XCTest
@testable import SpaceXList


class SpaceXListTestsCases: XCTestCase {
    var objectSpaceXViewModeltest: SpaceXViewModel?

    override func setUpWithError() throws {
        objectSpaceXViewModeltest = SpaceXViewModel()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        objectSpaceXViewModeltest = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNumberofRows(){
        let results = objectSpaceXViewModeltest?.getNumofRows()
        XCTAssertEqual(results, 0)
        
        
    }
    
    
    func testGetLaunch(){
        let launch1 = objectSpaceXViewModeltest?.getLaunchIndex(for: 1)
        XCTAssertNil(launch1)
        
        let launch2 = objectSpaceXViewModeltest?.getLaunchIndex(for: 2)
        XCTAssertNil(launch2)
    
    }
    
    
        
    //func testgetLaunchIndex(){
    //    let results = objectSpaceXViewModeltest?.getLaunchIndex(index: 2)
        //    XCTAssertEqual(results, 2 as! SpaceXModel)
    //}
        
        
        
    
   // func testLaunchIndex(){
     //   let results = objectSpaceXViewModeltest?.getLaunchIndex(index: 5)
     //   XCTAssertEqual(results!, SpaceXModel)
   // }
    
    

    func testExample() throws {
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
