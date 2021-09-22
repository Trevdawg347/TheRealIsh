//
//  ExampleView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/15/21.
//

import SwiftUI

struct ExampleView: View {
    
    @EnvironmentObject var items: itemListViewModel
    
    var body: some View {
        VStack {
            Text(items.subjectInstanceName)
        }
    }
}


struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
            .preferredColorScheme(.dark)
            .environmentObject(itemListViewModel())
    }
}
