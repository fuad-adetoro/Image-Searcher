//
//  HelperViews.swift
//  ImageSearcher
//
//  Created by Fuad on 09/06/2022.
//

import SwiftUI

struct SafeAreaBackgroundColorView: View {
    @Binding var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                $color.wrappedValue.frame(height: geometry.safeAreaInsets.top, alignment: .top).ignoresSafeArea()
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
