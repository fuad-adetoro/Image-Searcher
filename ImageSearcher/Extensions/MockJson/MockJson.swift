//
//  MockJson.swift
//  ImageSearcher
//
//  Created by Fuad on 09/06/2022.
//

import Foundation

class MockJSON {
    static let shared = MockJSON()
    
    func retrieveData() -> Data {
         let jsonData = """
        {
            "total":1,
            "totalHits":1,
            "hits":[{
            "id":3092912,
            "pageURL":"https://pixabay.com/photos/pin-pinn-needle-thumbtacks-plastic-3092912/","type":"photo","tags":"pin, pinn needle, thumbtacks",
            "previewURL":"https://cdn.pixabay.com/photo/2018/01/19/17/35/pin-3092912_150.jpg",
            "previewWidth":150,
            "previewHeight":99,
            "webformatURL":"https://pixabay.com/get/g595aa457e530a54fccd6d94cfe14b66ef0289b46906242e37dade142ac50467ee3950e2e7c7f3714a3db0e7dda38e4443541a2f1bb476f6927dcabab7651e786_640.jpg",
            "webformatWidth":640,
            "webformatHeight":426,
            "largeImageURL":"https://pixabay.com/get/g53e773f519f859d0610d32023a2a0a5fa8aef8f6bdd5f20cffadf0c1d806a40ee1dd60998400b49dccfb99e5b65bf46b18e7388c97783326268ddee3145735b8_1280.jpg","imageWidth":6000,"imageHeight":4000,
            "imageSize":3603026,
            "views":999,
            "downloads":374,
            "collections":8,
            "likes":19,
            "comments":10,
            "user_id":1564471,
            "user":"anncapictures",
            "userImageURL":"https://cdn.pixabay.com/user/2015/11/27/06-58-54-609_250x250.jpg"
        }]}

        """.data(using: .utf8)!
        
        return jsonData
    }
}
