//
//  AsyncronousImage.swift
//  ImageSearcher
//
//  Created by Fuad on 09/06/2022.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let image: (UIImage) -> Image
    
    @State private var height: CGFloat = 100.0
    
    init(
        height: CGFloat,
        url: URL,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
    ) {
        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
        print("HEIGHT: OTHER : \(height)")
        self.height = height
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!)
                    .resizable()
                    .frame(width: height, height: height)
                    .aspectRatio(contentMode: .fit)
            } else {
                placeholder
            }
        }
    }
}
