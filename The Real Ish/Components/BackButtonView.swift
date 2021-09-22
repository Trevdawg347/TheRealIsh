//
//  BackButtonView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/7/21.
//

import SwiftUI

struct BackButtonView: View {
    var body: some View {
        Image(systemName: "chevron.left")
            .resizable()
            .frame(width: 15, height: 20)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .padding()
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
    }
}
