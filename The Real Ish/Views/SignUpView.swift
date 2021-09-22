//
//  SignUpView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/8/21.
//

import SwiftUI

struct SignUpView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @EnvironmentObject private var fb: FirebaseViewModel
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                Form {
                    Section(header: Text("Name")) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                    }
                    Section(header: Text("Email")) {
                        TextField("Email", text: $email)

                    }
                    Section(header: Text("Password")) {
                        SecureField("Password", text: $password)
                        SecureField("Confirm Password", text: $confirmPassword)
                    }
                }
                Button(action: {
                    fb.signUp(email: email, password: password)
                    }
                , label: {
                    Text("Create account")
                        .foregroundColor(Color.theme.accent)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color.theme.pinkColor)
                        .padding(10)
                        .padding(.horizontal)
                })
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .preferredColorScheme(.dark)
            .environmentObject(FirebaseViewModel())
    }
}
