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
    @State private var errorMessage = ""
    @State private var messageLabel = Text("")
    @State private var loginButton = Button("Login", action: {})
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            messageLabel // State-stored label
            
            loginButton // State-stored button
        }
        .padding()
        .onAppear {
            updateLoginButton() // UI injection
        }
    }
    
    private func updateLoginButton() {
        loginButton = Button("Login") {
            if username.isEmpty || password.isEmpty {
                errorMessage = "Both fields are required."
                messageLabel = Text(errorMessage).foregroundColor(.red)
            } else if username != "admin" || password != "password" {
                errorMessage = "Invalid credentials."
                messageLabel = Text(errorMessage).foregroundColor(.orange)
            } else {
                messageLabel = Text("Login successful!").foregroundColor(.green)
            }
        }
    }
}

#Preview {
    LoginView()
}
