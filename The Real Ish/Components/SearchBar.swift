//
//  SearchBar.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/11/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var textFieldText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search...", text: $textFieldText)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 45)
        .background(Color.theme.secondaryText)
        .foregroundColor(Color.theme.accent)
        .padding()
        .overlay(
            Image(systemName: "xmark.circle.fill")
                .padding()
                .offset(x: -20)
                .foregroundColor(Color.theme.accent)
                .opacity(textFieldText.isEmpty ? 0.0 : 1.0)
                .onTapGesture {
                    UIApplication.shared.endEditing()
                    textFieldText = ""
                }
            
            , alignment: .trailing
        )
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(textFieldText: .constant("yo"))
            .preferredColorScheme(.dark)
    }
}
