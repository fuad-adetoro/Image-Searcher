//
//  ImageSearcherTests.swift
//  ImageSearcherTests
//
//  Created by Fuad on 08/06/2022.
//

import XCTest
@testable import ImageSearcher

class ImageSearcherTests: XCTestCase {

    func testQueryString() {
        let searchText = "Blue Flowers"
        
        XCTAssertEqual(searchText.mediaQuery, "Blue+Flowers")
    }
    
    func testCleanedString() {
        let searchText = "Or@nges"
        
        XCTAssertEqual(searchText.cleaned, "Ornges")
    }
    
    func testCleanAndQueryString() {
        let searchText = "Blue$$$$ Flowers".cleaned.mediaQuery
        
        XCTAssertEqual(searchText, "Blue+Flowers")
    }
    
    func testParser() {
        let data = MockJSON.shared.retrieveData()
        
        let imageSearchData = ImageSearcherAPI.shared.parse(json: data)
        
        XCTAssertEqual(imageSearchData.count, 1)
    }
    
    func testMockDataFirstResult() {
        let data = MockJSON.shared.retrieveData()
        
        let imageSearchData = ImageSearcherAPI.shared.parse(json: data)
        
        let firstResult = imageSearchData[0]
        
        XCTAssertEqual(firstResult.id, 3092912)
    }

}
