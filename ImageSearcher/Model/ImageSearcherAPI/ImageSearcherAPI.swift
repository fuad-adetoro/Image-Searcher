//
//  ImageSearcherAPI.swift
//  ImageSearcher
//
//  Created by Fuad on 09/06/2022.
//

import Foundation

enum APIError: Error {
    case dataError
    case responseError
}

class ImageSearcherAPI {
    static let shared = ImageSearcherAPI()
    
    let apiURL = "https://pixabay.com/api/?key="
    let apiKey = "13197033-03eec42c293d2323112b4cca6"
    
    func searchForImages(using searchText: String, completion: @escaping (([ImageSearcherResult], Error?) -> Void)) {
        let url = self.constructURL(using: searchText)
        
        var request = URLRequest(url: url)
        
        request.cachePolicy = .returnCacheDataDontLoad
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion([], error)
                return
            }
            
            guard let data = data else {
                completion([], APIError.dataError)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion([], APIError.responseError)
                return
            }
            
            if response.statusCode != 200 {
                completion([], APIError.responseError)
                return
            }
            
            let imageSearcherResults = self.parse(json: data)
            
            completion(imageSearcherResults, nil)

        }
        .resume()
    }
    
    private func constructURL(using searchText: String) -> URL {
        let constructedURL = "\(apiKey)\(apiKey)\(searchText)"
        
        
        let url = URL(string: constructedURL)!
        
        return url
    }
    
    // Parsing Data to 'ImageSearcherResults' array...
    private func parse(json: Data) -> [ImageSearcherResult] {
        let decoder = JSONDecoder.init()
        
        var imageSearcherResults: [ImageSearcherResult] = .init()
        
        if let imageSearcherHit = try? decoder.decode(ImageSearcherHit.self, from: json) {
            imageSearcherResults = imageSearcherHit.hits
        }
        
        return imageSearcherResults
    }
}
