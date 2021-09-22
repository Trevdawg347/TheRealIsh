//
//  FirebaseStorageService.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/15/21.
//

import UIKit
import Firebase
import FirebaseStorage

class FirebaseStorageService {
    
    var caption: String!
    var imageDownloadURL: String?
    private var image: UIImage!
    
    init(image: UIImage, caption: String) {
        self.image = image
        self.caption = caption
    }
    
    func save() {
        // 1. Create a new databse reference
        
        // 2. Create a new storage reference
        
        // 3. save the image to storage first.
        
        // 4. save the post caption & download url.
    }
    
}
