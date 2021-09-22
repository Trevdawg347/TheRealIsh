//
//  CustomizePostView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/18/21.
//

import SwiftUI

struct CustomizePostView: View {
    
    @State private var showImages: Bool = false
    @State private var caption: String = ""
    @State var imageBind: UIImage?
    
    @State private var selection: String? = ""
    private let tag = "selectSubjects"
    
    @EnvironmentObject private var items: itemListViewModel
    @EnvironmentObject private var user: User
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 50) {
                Button(action: {
                    showImages.toggle()
                }, label: {
                    Text("Select Image...")
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color.theme.secondaryText)
                })
                TextEditor(text: $caption)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Color.theme.secondaryText)
                    .foregroundColor(Color.theme.accent)
                    .padding()
                if items.image != nil {
                    Image(uiImage: items.image!)
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                                
                }


                Button(action: {
                    items.caption = caption
                    selection = tag
                    caption = ""
                }, label: {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .font(.largeTitle)
                        .background(Color.blue)
                })
            }
            .padding(.horizontal)
            .sheet(isPresented: $showImages, content: {
                ImagePickerView(image: $items.image)
            })
            NavigationLink(
                destination: SelectSubjectView(),
                tag: tag,
                selection: $selection,
                label: {})
        }
    }
}

struct CustomizePostView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizePostView()
            .environmentObject(User())
            .environmentObject(itemListViewModel())
            .environmentObject(FirebaseViewModel())
    }
}
