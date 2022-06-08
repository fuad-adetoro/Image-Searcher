//
//  ContentView.swift
//  ImageSearcher
//
//  Created by Fuad on 08/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var imageSearcherResults: [ImageSearcherResult] = .init()
    @State var reloadView = false
    
    func parse(json: Data) {
        let decoder = JSONDecoder.init()
        
        if let imageSearcherHit = try? decoder.decode(ImageSearcherHit.self, from: json) {
            imageSearcherResults = imageSearcherHit.hits
            
            reloadView = true
        }
        
        print("RESULTS: \(imageSearcherResults.count)")
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Hello, world!!!!")
                    .padding()
                    .onAppear {
                        print("APPEARED!!")
                        
                        let url = URL(string: "https://pixabay.com/api/?key=13197033-03eec42c293d2323112b4cca6&q=yellow+flowers&i")!
                        
                        if let data = try? Data(contentsOf: url) {
                            parse(json: data)
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
