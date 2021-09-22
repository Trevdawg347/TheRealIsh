//
//  PostsView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/7/21.
//


// Eventually Delete this

import SwiftUI

struct PostsView: View {
    
    @State var videos: [String]
    
    var body: some View {
        ForEach(videos, id: \.self) { video in
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("Title of the user")
                }
                Rectangle()
                    .frame(width: 370, height: 250)
                Text("Description of the video")
                
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(videos: ["sup", "yo"])
            .preferredColorScheme(.dark)
    }
}
