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
        XCTAssertEqual(firstResult.largeImageURL, "https://pixabay.com/get/g53e773f519f859d0610d32023a2a0a5fa8aef8f6bdd5f20cffadf0c1d806a40ee1dd60998400b49dccfb99e5b65bf46b18e7388c97783326268ddee3145735b8_1280.jpg")
    }

}
