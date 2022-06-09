//
//  ImageSearcherViewModel.swift
//  ImageSearcher
//
//  Created by Fuad on 08/06/2022.
//

import SwiftUI

public class ImageSearcherViewModel: ObservableObject {
    static let shared = ImageSearcherViewModel.init()
    
    @Published var isLoading = false
    @Published var errorLoading = false
    @Published var imageSearcherResults: [ImageSearcherResult] = []
    
    func searchForImages(searchText: String) {
        let searchTextCleaned = searchText.cleaned
        let searchQuery = searchTextCleaned.mediaQuery
        
        self.isLoading = true
        
        ImageSearcherAPI.shared.searchForImages(using: searchQuery) { [weak self] imageSearcherResults, error in
            DispatchQueue.main.async {
                self?.isLoading = false
            } 
            
            guard error == nil else {
                self?.returnError()
                
                return
            }
            
            self?.returnResults(imageSearcherResults: imageSearcherResults)
        }
    }
    
    private func returnError() {
        DispatchQueue.main.async { [weak self] in
            self?.imageSearcherResults = []
            self?.errorLoading = true
        }
    }
    
    private func returnResults(imageSearcherResults: [ImageSearcherResult]) {
        DispatchQueue.main.async { [weak self] in
            self?.errorLoading = false
            self?.imageSearcherResults = imageSearcherResults
        }
    }
}
