//
//  HomeView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/6/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            SubjectsView().tabItem { Image(systemName: "house.fill") }.tag(1)
            ProfileView().tabItem { Image(systemName: "person.fill") }.tag(2)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .environmentObject(itemListViewModel())
    }
}
