//
//  UserModel.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/9/21.
//

import Foundation
import SwiftUI

class User: ObservableObject {
    @Published var username = "Trevdawg347"
    @Published var firstName = ""
    @Published var lastName = ""
    
    @Published var posts: [Posts] = []
    @Published var profileImage = UIImage()
}

struct Posts: Identifiable {
    var id: String
    var image: UIImage?
    var caption: String
    var subjects: [String]
}



struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
}
