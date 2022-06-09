//
//  String+clean.swift
//  ImageSearcher
//
//  Created by Fuad on 09/06/2022.
//

import Foundation

extension String {
    var cleaned: String {
        let okayCharacters = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return self.filter {okayCharacters.contains($0) }
    }
}
