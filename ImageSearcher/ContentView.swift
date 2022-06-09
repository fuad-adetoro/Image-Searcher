//
//  ContentView.swift
//  ImageSearcher
//
//  Created by Fuad on 08/06/2022.
//

import SwiftUI

struct ContentView: View {
    let numOfItems = 10
    let numOfColumns = 3
    let spacing: CGFloat = 10
    
    var body: some View {
        GeometryReader { g in
            let columns = Array(repeating: GridItem(.adaptive(minimum: 90, maximum: 180)), count: numOfColumns)
            let numOfRows: Int = Int(ceil(Double(numOfItems) / Double(numOfColumns)))
            let height: CGFloat = (g.size.height - (spacing * CGFloat(numOfRows - 1))) / CGFloat(numOfRows)

            LazyVGrid(columns: columns, alignment: .leading, spacing: spacing) {
                ForEach(0..<numOfItems, id: \.self) { object in
                    MyView().frame(minHeight: height, maxHeight: .infinity)
                }
            }
        }
    }}

struct MyView: View {
    var body: some View {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
