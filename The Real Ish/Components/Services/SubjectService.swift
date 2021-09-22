//
//  UserService.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/11/21.
//

import Foundation

class SubjectService {
    
    @Published var subjects: [UserModel] = []
    
    init() {
        getUsers()
    }
    
    private func getUsers() {
        let user1 = UserModel(name: "Business")
        let user2 = UserModel(name: "School")
        let user3 = UserModel(name: "Self Improvement")
        let user4 = UserModel(name: "Sports")
        let user5 = UserModel(name: "Financial")
        let user6 = UserModel(name: "Night Routine")
        let user7 = UserModel(name: "Beauty")
        let user8 = UserModel(name: "Fashion")
        let user9 = UserModel(name: "Morning Routine")
        let user10 = UserModel(name: "Workout Motivation")
        subjects.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
    }
    
}
