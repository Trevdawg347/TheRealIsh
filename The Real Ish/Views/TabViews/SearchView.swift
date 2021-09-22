//
//  SearchView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/6/21.
//


// Search View, view that you can search more indefinetly about the subject, or search for people like Youtube search bar.

import SwiftUI

struct SearchView: View {
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 2, alignment: nil),
        GridItem(.flexible(), spacing: 2, alignment: nil),
        GridItem(.flexible(), spacing: 2, alignment: nil),
    ]
    
    private let tag = "Home"
    @State private var selection: String? = ""
    @State private var searchVideos: [String] = ["sja", "asdf", "sadf", "asdf", "asdf"]
    
    @EnvironmentObject private var items: itemListViewModel
    
    var body: some View {
        
        
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                
                NavigationLink(
                    destination: HomeView(),
                    tag: tag,
                    selection: $selection,
                    label: {})
                
                Button(action: { selection = tag }, label: {
                    BackButtonView()
                })
                
                SearchBar(textFieldText: $items.textFieldText)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 3) {
                        ForEach(0..<50) { image in
                            Rectangle()
                                .frame(width: (UIScreen.main.bounds.width / 3) - 10, height: (UIScreen.main.bounds.height / 5))
                                .foregroundColor(Color.theme.accent)
                        }
                    }
                    .padding(10)
                }
                
            }
            .navigationBarHidden(true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
            .environmentObject(itemListViewModel())
    }
}
