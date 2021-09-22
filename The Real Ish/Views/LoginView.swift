//
//  LoginView.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/7/21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String  = ""
    @State private var password: String = ""
    private let tag = "createAccount"
    @State private var selection: String? = ""
    
    @EnvironmentObject private var fb: FirebaseViewModel
    
    var body: some View {
        
        ZStack {
            if fb.signedIn {
                HomeView()
        } else {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 200, height: 150)
                Spacer()
                TextField("Username", text: $email)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.theme.secondaryText)
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.theme.secondaryText)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    fb.signIn(email: email, password: password)
                }, label: {
                    Text("Login")
                        .foregroundColor(Color.theme.accent)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color.theme.pinkColor)
                        .padding(10)
                        .padding(.horizontal)
                })
                
                NavigationLink(
                    destination: SignUpView(),
                    tag: tag,
                    selection: $selection,
                    label: {})
                
                Button(action: { selection = tag }, label: {
                    Text("Sign Up")
                        .foregroundColor(Color.theme.accent)
                        .font(.headline)
                        .frame(width: 100, height: 100)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)))
                        .padding(.horizontal)
                })
                Text("By signing in you agree to our terms and conditions.")
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(Color.theme.accent)
            }
        }
    }
    .onAppear {
    fb.signedIn = fb.isSignedIn
    }
}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}
