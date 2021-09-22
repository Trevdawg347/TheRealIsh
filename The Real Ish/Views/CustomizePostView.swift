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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            Button(action: {
                showImages.toggle()
            }, label: {
                Text("Select Image...")
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color.theme.secondaryText)
            })
            if items.image != nil {
                Image(uiImage: items.image!)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
            } else {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
            }
            VStack(alignment: .leading) {
                Text("Caption:")
                TextEditor(text: $caption)
            }
            .background(Color.red)
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

struct CustomizePostView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizePostView()
            .environmentObject(User())
            .environmentObject(itemListViewModel())
            .environmentObject(FirebaseViewModel())
    }
}
