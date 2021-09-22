//
//  ItemsView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/3/21.
//

import SwiftUI

struct ItemsView: View {
    
    @State private var tabSelect = 1
    @State private var backButton: Bool = false
    
    
    var body: some View {
        
        TabView(content: {
            
            UserFollowingView().tabItem { Image(systemName: "person") }.tag(1)
            
            SearchView().tabItem { Image(systemName: "magnifyingglass") }.tag(2)
            
            FeaturedView().tabItem { Image(systemName: "house.fill") }.tag(3)
            
        }
        
        )}
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
            .preferredColorScheme(.dark)
            .environmentObject(itemListViewModel())
            .environmentObject(User())
    }
}
