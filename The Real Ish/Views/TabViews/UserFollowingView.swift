//
//  UserFollowingView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/6/21.
//

import SwiftUI

struct UserFollowingView: View {
    
    @EnvironmentObject private var user: User
    @EnvironmentObject private var items: itemListViewModel
    @EnvironmentObject private var fb: FirebaseViewModel
    
    private let tag = "Home"
    @State private var selection: String? = ""
    
    var body: some View {
        if items.FirebasePostSubjects.contains(items.subjectInstanceName) {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text(items.subjectInstanceName)
                        .font(.largeTitle)
                        .foregroundColor(Color.theme.accent)
                    HStack {
                        Button(action: {
                            selection = tag
                        }, label: {
                            BackButtonView()
                        })
                        NavigationLink(
                            destination: ExampleView(),
                            label: {
                                Text("Navigate")
                            })
                    }
                    NavigationLink(
                        destination: HomeView(),
                        tag: tag,
                        selection: $selection,
                        label: {})
                    
                    ScrollView {
                        ForEach(fb.posts.reversed()) { post in
                            NewPostView(post: post)
                        }
                        
                        Text("You might also like")
                        Rectangle()
                            .frame(width: 300, height: 100)
                        Rectangle()
                            .frame(width: 300, height: 100)
                        Rectangle()
                            .frame(width: 300, height: 100)
                    }
                    .foregroundColor(Color.theme.accent)
                    .navigationBarHidden(true)
                    
                }
            }
            .onAppear(perform: {
                fb.loadPosts()
            })
        } else {
            VStack(alignment: .leading) {
                NavigationLink(
                    destination: HomeView(),
                    tag: tag,
                    selection: $selection,
                    label: {})
                Button(action: {
                    selection = tag
                }, label: {
                    BackButtonView()
                })
                Spacer()
                Text("Error loading view")
                Spacer()
            }
        }
    }
}

struct UserFollowingView_Previews: PreviewProvider {
    static var previews: some View {
        UserFollowingView()
            .preferredColorScheme(.dark)
            .environmentObject(User())
            .environmentObject(itemListViewModel())
            .environmentObject(FirebaseViewModel())
    }
}

