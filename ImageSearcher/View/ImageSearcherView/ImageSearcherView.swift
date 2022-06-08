//
//  ImageSearcherView.swift
//  ImageSearcher
//
//  Created by Fuad on 08/06/2022.
//

import SwiftUI

struct ImageSearcherView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var searchText: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack(spacing: 0) {
                    Spacer()
                        .frame(height: geometry.size.height / 2 - 220)
                    
                    Text("Search for photos")
                    
                    Spacer().frame(height: 10)
                    
                    ImageSearcherViewSearchTextField.init(searchText: $searchText, placeholder: .constant("Search for an image, e.g. flowers"))
                    
                    Spacer().frame(height: 25)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            print("button clicked!")
                        } label: {
                            Group {
                                Text("Search Now")
                                    .foregroundColor(.white)
                            }
                            .padding(16)
                            .background(.blue)
                            .cornerRadius(16)
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ImageSearcherViewSearchTextField: View {
    @Binding var searchText: String
    @Binding var placeholder: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 20)
                
                SearchTextField.init(text: $searchText, placeholder: $placeholder)
                
                Spacer().frame(width: 20)
            }
        }
    }
}

struct SearchTextField: View {
    @Binding var text: String
    @Binding var placeholder: String
    
    var body: some View {
        VStack {
            TextField.init($placeholder.wrappedValue, text: $text)
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct ImageSearcherView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSearcherView()
            .preferredColorScheme(.light)
        
        ImageSearcherView()
            .preferredColorScheme(.dark)
    }
}
