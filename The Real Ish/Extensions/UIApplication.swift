//
//  UIApplication.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/11/21.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

