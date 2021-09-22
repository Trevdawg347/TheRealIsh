//
//  NewPostView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/11/21.
//

import SwiftUI

struct NewPostView: View {
    
    @EnvironmentObject var user: User
    @EnvironmentObject private var items: itemListViewModel
    @State var post: Posts
    @State private var likes: Int = 0
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        VStack {
            Image(uiImage: post.image!)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: UIScreen.main.bounds.width / 3)
                .clipped()
            Text(post.caption)
        }
    }
}
