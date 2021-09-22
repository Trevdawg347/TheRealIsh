//
//  SubjectsView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/3/21.
//

import SwiftUI

struct SubjectsView: View {
    
    @EnvironmentObject private var items: itemListViewModel
    private let tag = "itemView"
    @State private var selection: String? = ""
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Subjects")
                    .foregroundColor(Color.theme.accent)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 36)
                ScrollView() {
                    SearchBar(textFieldText: $items.textFieldText)
                    ForEach(items.subjects) { item in
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color.theme.pinkColor)
                            .padding(4)
                            .frame(maxWidth: . infinity)
                            .frame(height: UIScreen.main.bounds.height / 3)
                            .padding(.horizontal)
                            .onTapGesture {
                                items.subjectInstanceName = item.name
                                selection = tag
                            }
                            .overlay(
                                Text(item.name)
                                    .font(.largeTitle)
                                    .padding(30)
                                    .foregroundColor(Color.theme.accent)
                            )
                    }
                }
            }
            NavigationLink(
                destination: ItemsView(),
                tag: tag,
                selection: $selection,
                label: {})
        }
        .navigationBarHidden(true)
    }
}

struct SubjectsView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectsView()
            .preferredColorScheme(.dark)
            .environmentObject(itemListViewModel())
    }
}
