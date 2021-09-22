//
//  FeaturedView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/6/21.
//

import SwiftUI

// Featured VIew, view for random featured videos in that section

struct FeaturedView: View {
    
    private let tag = "Home"
    @State private var selection: String? = ""
    @State private var videos = ["sup", "jsl", "sdjlf", "sdljf;"]
    
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
                
                ScrollView {
                    PostsView(videos: videos)
                }
                .foregroundColor(Color.theme.accent)
                .navigationBarHidden(true)
            }
        }
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeaturedView()
                .navigationTitle("Featured")
                .preferredColorScheme(.dark)
        }
    }
}
