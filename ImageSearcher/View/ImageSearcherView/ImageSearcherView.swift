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
    
    @ObservedObject private var viewModel = ImageSearcherViewModel.shared
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    ImageSearcherViewSafeAreaBackgroundColorView.init()
                    
                    VStack(spacing: 0) {
                        Spacer()
                            .frame(height: geometry.size.height / 2 - 120)
                        
                        Text("Search for photos")
                        
                        Spacer().frame(height: 10)
                        
                        ImageSearcherViewSearchTextField.init(searchText: $searchText, placeholder: .constant("Search for an image, e.g. flowers"))
                        
                        Spacer().frame(height: 25)
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                viewModel.searchForImages(searchText: $searchText.wrappedValue)
                            } label: {
                                Group {
                                    Text("Search Now")
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                }
                                .padding(20)
                                .background(Color("CustomColor"))
                                .cornerRadius(16)
                            }
                            
                            Spacer()
                        }
                        
                        Spacer()
                    }
                }
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline) 
            }
        }
    }
}

struct ImageSearcherViewSafeAreaBackgroundColorView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Color("CustomColor").frame(height: geometry.safeAreaInsets.top, alignment: .top).ignoresSafeArea()
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
