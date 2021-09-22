//
//  ItemListModel.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/3/21.
//

import Foundation
import Combine
import SwiftUI

class itemListViewModel: ObservableObject {
    
    @Published var textFieldText = ""
    @Published var subjects: [UserModel] = []
    @Published var subjectInstanceName: String = ""
    @Published var count: Int = 0
    @Published var image: UIImage?
    @Published var caption: String = ""
    @Published var FirebasePostSubjects: [String] = []
    private var cancellables = Set<AnyCancellable>()
    private let userService = SubjectService()
    
    
    init() {
        addSubscriber()
        self.image = image
    }
    
    func addSubscriber() {
        
        $textFieldText
            .combineLatest(userService.$subjects)
            .map { (text, subjects) -> [UserModel] in
                guard !text.isEmpty else {
                    return subjects
                }
                
                let lowercasedText = text.lowercased()
                
                return subjects.filter { (user) -> Bool in
                    return user.name.lowercased().contains(lowercasedText)
                }
            }
            .sink { [weak self] (returnedSubjects) in
                self?.subjects = returnedSubjects
            }
            .store(in: &cancellables)
    }
    
}
