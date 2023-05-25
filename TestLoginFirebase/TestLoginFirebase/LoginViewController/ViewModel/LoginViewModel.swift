//
//  LoginViewModel.swift
//  TestLoginFirebase
//
//  Created by Gabriel Luz Romano on 23/05/23.
//

import Foundation
import Firebase

class LoginViewModel {
    
    public func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso Login")
            } else {
                print("Falha em realizar login, segue o erro \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    public func validateFields(email: String , password: String) -> Bool {
        return (email.count >= 5 && password.count >= 4)
    }
}
