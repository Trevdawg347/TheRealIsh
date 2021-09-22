//
//  SelectSubjectView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/11/21.
//

import SwiftUI

struct SelectSubjectView: View {
    
    @EnvironmentObject private var items: itemListViewModel
    @EnvironmentObject private var user: User
    @EnvironmentObject private var fb: FirebaseViewModel
    
    @State private var showComments = true
    @State private var showLikes = true
    private let tag = "tag"
    @State private var selection: String? = ""
    @State private var animate: Bool = false
    @State private var showAlert: Bool = false
    @State private var subjects = SubjectService()
    
    @State private var list: [String] = []
        
    var body: some View {
        VStack {
            Text("Select up to 3 subjects that your post corresponds with.")
                .multilineTextAlignment(.center)
                .font(.title)
            ScrollView {
                ForEach(items.subjects) { item in
                    CheckMarkSubjectsView(subjects: item.name)
                }
            }
            
            NavigationLink(
                destination: HomeView(),
                tag: tag,
                selection: $selection,
                label: {})
            
            Button(action: {
                if (items.count > 3) || (items.count < 1) {
                    showAlert.toggle()
                } else {
                    fb.addPost(image: items.image!, caption: items.caption, collections: subjects.business)
                    selection = tag
                    items.image = nil
                }
            }, label: {
                Text("Share")
                    .foregroundColor(Color.theme.accent)
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Color.theme.pinkColor)
            })
            .padding(.horizontal, 40)
        }
        .padding(.bottom)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Please make sure the amount of selected subjects is 3 or less, and you have atleast 1 subject selected."))
        }
    }
}

struct SelectSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSubjectView()
            .environmentObject(itemListViewModel())
    }
}
