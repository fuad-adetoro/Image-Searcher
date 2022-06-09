//
//  String+mediaQuery.swift
//  ImageSearcher
//
//  Created by Fuad on 09/06/2022.
//

import Foundation

extension String {
    var mediaQuery: String {
        var mediaQuery = ""
        
        let searchComponents = self.components(separatedBy: " ")
        
        for component in searchComponents {
            if mediaQuery == "" {
                mediaQuery = component
            } else {
                mediaQuery = mediaQuery + "+\(component)"
            }
        } 
        
        return mediaQuery
    } 
}
