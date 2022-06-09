//
//  ImageSearcherResult.swift
//  ImageSearcher
//
//  Created by Fuad on 08/06/2022.
//

import Foundation

public struct ImageSearcherResult: Codable, Identifiable {
    public var id: Int
    public var largeImageURL: String
}
