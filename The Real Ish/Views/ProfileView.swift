//
//  ProfileView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/6/21.
//

import SwiftUI

// Profile View, the view that users can use to see their videos and/or saved videos. Pair this one with the homeview in a tab bar at the bottom

struct ProfileView: View {
    
    @State var image: UIImage?
    @State var savedImages = []
    private let tag = "exampleView"
    @State private var url = URL(string: "")
    @State private var selection: String? = ""
    @State private var showImages: Bool = false
    
    @State private var imageData: Data = Data()
    @State private var pickedImage: Image?
    @State private var profileImage: Image?
    
    @EnvironmentObject private var fb: FirebaseViewModel
    @EnvironmentObject private var user: User
    @EnvironmentObject private var items: itemListViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 2, alignment: nil),
        GridItem(.flexible(), spacing: 2, alignment: nil),
        GridItem(.flexible(), spacing: 2, alignment: nil),
    ]
    
    func loadImage() {
        guard let inputImage = pickedImage else { return }
        
        profileImage = inputImage
    }
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            NavigationLink(
                destination: CustomizePostView(),
                tag: tag,
                selection: $selection,
                label: {})
            
            VStack {
                HStack(spacing: 20) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.theme.accent)
                    HStack(spacing: 60) {
                        VStack {
                            Text("Followers")
                            Text("\(0)")
                        }
                        .foregroundColor(Color.theme.accent)
                        VStack {
                            Text("Followers")
                            Text("\(0)")
                        }
                        .foregroundColor(Color.theme.accent)
                    }
                    
                    Button(action: {
                        selection = tag
                    }, label: {
                        Image(systemName: "plus.square")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.theme.accent)
                    })
                }
                Button(action: {
                    fb.signOut()
                }, label: {
                    Text("Saved Videos")
                        .font(.callout)
                        .fontWeight(.bold)
                        .padding(.trailing, 230)
                        .padding(10)
                        .foregroundColor(Color.theme.accent)
                })
                
                Spacer()
                ScrollView {
                    Text("SUP")
                }
            }
            .sheet(isPresented: $showImages) {
                ImagePickerView(image: $image)
            }
            
            
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}
