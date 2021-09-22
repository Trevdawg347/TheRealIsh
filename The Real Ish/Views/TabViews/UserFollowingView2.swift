//
//  UserFollowingView2.swift
//  The Real Ish
//
//  Created by Forrest Buhler on 9/21/21.
//

import SwiftUI

struct UserFollowingView2: View {
    
    @EnvironmentObject private var fb: FirebaseViewModel
    @EnvironmentObject private var items: itemListViewModel
    
    
    var body: some View {
        ScrollView {
            ForEach(fb.posts.reversed()) { post in
                if post.subjects.contains(items.subjectInstanceName) {
                    Image(uiImage: post.image!)
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text(post.caption)
                    
                }
            }
        }
    }
}

struct UserFollowingView2_Previews: PreviewProvider {
    static var previews: some View {
        UserFollowingView2()
    }
}
