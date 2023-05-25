//
//  CheckEmailViewModel.swift
//  TestLoginFirebase
//
//  Created by Gabriel Luz Romano on 24/05/23.
//

import Foundation
import Firebase

class CheckEmailViewModel {
    public func validateEmail(email: String) -> String {
        if email.isEmpty {
            return "Email is required!"
        } else if email.count < 5 {
            return "Email should be between 5 and 50 characters!"
        } else if !validateEmailFormat(email) {
            return "Please enter a valid email adress!"
        } else if checkIfEmailIsRegistered(email: email) {
            return "Email is already registered!"
        } else {
            return "ok"
        }
    }
    
    
    
    private func validateEmailFormat(_ email : String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    public func checkIfEmailIsRegistered(email: String) -> Bool {
        var emailIsRegistered: Bool = false
        Auth.auth().signIn(withEmail: email, password: "123") { (authResult, error) in
            if let error = error as NSError? {
                let errorCode = error.code
                
                // Tratamento específico de erros
                if errorCode == AuthErrorCode.userNotFound.rawValue {
                    emailIsRegistered = false
                } else {
                    emailIsRegistered = true
                }
            }
        }
        return emailIsRegistered
    }

    
    public func checkEmailExists(email: String) {
        Auth.auth().fetchSignInMethods(forEmail: email) { (signInMethods, error) in
            if let error = error {
                print("Ocorreu um erro ao verificar o e-mail: \(error.localizedDescription)")
                return
            }
            
            if let signInMethods = signInMethods {
                if signInMethods.isEmpty {
                    print("O e-mail não está cadastrado.")
                } else {
                    print("O e-mail já está cadastrado.")
                }
            }
        }
    }
}
