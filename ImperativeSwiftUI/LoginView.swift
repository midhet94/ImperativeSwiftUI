//
//  LoginView.swift
//  ImperativeSwiftUI
//
//  Created by Midhet Sulemani on 15/05/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var message = ""
    @State private var loginButton = Button("Login", action: {})
    
    var accentColor: Color
    var primaryColor: Color
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            if username.isEmpty || password.isEmpty {
                Text(message)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            } else if username != "Admin" || password != "password" {
                Text(message)
                    .font(.body)
                    .foregroundColor(.orange)
            } else {
                Text(message)
                    .font(.body)
                    .foregroundColor(.green)
            }
            
            loginButton
                .padding()
                .background(accentColor)
                .foregroundColor(primaryColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding()
        .onAppear {
            updateLoginButton()
        }
    }
    
    private func updateLoginButton() {
        loginButton = Button("Login") {
            if username.isEmpty || password.isEmpty {
                message = "Both fields are required."
            } else if username != "Admin" || password != "password" {
                message = "Invalid credentials."
            } else {
                message = "Login successful!"
            }
        }
    }
}

#Preview {
    LoginView(accentColor: .blue, primaryColor: .white)
}
