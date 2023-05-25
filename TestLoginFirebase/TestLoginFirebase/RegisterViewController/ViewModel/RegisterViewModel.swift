//
//  RegisterViewModel.swift
//  TestLoginFirebase
//
//  Created by Gabriel Luz Romano on 23/05/23.
//

import Foundation
import Firebase

class RegisterViewModel {
    
    public func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso Cadastro!")
            } else {
                print("Falha em realizar cadastro, segue o erro: \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    public func validateEmailTextField(email: String) -> String {
        if email.isEmpty {
            return "Email is required!"
        } else if email.count < 5 {
            return "Email should be between 5 and 50 characters!"
        } else if !validateEmailFormat(email) {
            return "Please enter a valid email adress!"
        } else {
            return "ok"
        }
    }
    
    public func validatePasswordTextField(password: String) -> String {
        if password.isEmpty {
            return "Password is required!"
        } else if password.count < 6 {
            return "Password should be between 6 and 50 characters!"
        } else {
            return "ok"
        }
    }
    
    private func validateEmailFormat(_ email : String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
