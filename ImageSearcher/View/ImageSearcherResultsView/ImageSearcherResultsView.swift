//
//  ImageSearcherResultsView.swift
//  ImageSearcher
//
//  Created by Fuad on 09/06/2022.
//

import SwiftUI

struct ImageSearcherResultsView: View {
    @EnvironmentObject var viewModel: ImageSearcherViewModel
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                SafeAreaBackgroundColorView(color: .constant(Color("CustomColor")))
                
                if viewModel.imageSearcherResults.isEmpty {
                    ImageSearcherEmptyResultsView.init()
                } else {
                    ImageSearcherResultsScrollView.init()
                        .environmentObject(viewModel)
                }
            }
        }
        .navigationBarTitle("Gallery", displayMode: .inline)
    }
}

struct ImageSearcherEmptyResultsView: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Text("There are no images for this search")
                    .font(.title3)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct ImageSearcherResultsScrollView: View {
    @EnvironmentObject var viewModel: ImageSearcherViewModel
    
    let numOfItems = 10
    let numOfColumns = 3
    let spacing: CGFloat = 6
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    let columns = Array(repeating: GridItem(.adaptive(minimum: 100, maximum: 240)), count: numOfColumns)
                    let numOfRows: Int = Int(ceil(Double(numOfItems) / Double(numOfColumns)))
                    let height: CGFloat = (geometry.size.height - (spacing * CGFloat(numOfRows - 1))) / CGFloat(numOfRows)

                    LazyVGrid(columns: columns, alignment: .leading, spacing: spacing) {
                        ForEach(viewModel.imageSearcherResults) { result in
                            AsyncImage.init(height: height, url: URL(string: result.largeImageURL)!) {
                                VStack {
                                    Spacer()
                                    
                                    HStack {
                                        Spacer()
                                        
                                        ProgressView()
                                            .progressViewStyle(.circular)
                                        
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                }
                                    
                            } image: { image in
                               Image(uiImage: image)
                            }
                        } 
                    }
                }
            }
        }
    }
}

struct ImageSearcherResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSearcherResultsView()
            .preferredColorScheme(.dark)
        
        ImageSearcherResultsView()
            .preferredColorScheme(.light)
    }
}
