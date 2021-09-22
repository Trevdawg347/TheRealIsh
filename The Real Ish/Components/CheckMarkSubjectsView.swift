//
//  CheckMarkSubjectsView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/9/21.
//

import SwiftUI

struct CheckMarkSubjectsView: View {
    
    @State private var animate: Bool = false
    @State var subjects: String
    
    @EnvironmentObject private var items: itemListViewModel
    
    var body: some View {
        VStack() {
            HStack {
                Image(systemName: animate ? "checkmark.square" : "square")
                Text(subjects)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 75)
            .padding(.horizontal, 35)
            .background(Color.theme.sheetColor)
            .onTapGesture {
                if !animate {
                    items.count += 1
                    items.FirebasePostSubjects.append(subjects)
                } else {
                    items.count -= 1
                    items.FirebasePostSubjects.removeAll(where: { $0 == subjects })
                }
                animate.toggle()
            }
        }
    }
}

struct CheckMarkSubjectsView_Previews: PreviewProvider {
    static var previews: some View {
        CheckMarkSubjectsView(subjects: "Sup")
            .environmentObject(itemListViewModel())
    }
}
