//
//  LoginViewModel.swift
//  TestLoginFirebase
//
//  Created by Gabriel Luz Romano on 23/05/23.
//

import Foundation
import Firebase

class LoginViewModel {
    
    public func loginUser(email: String, password: String, completion: @escaping (String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                completion(loginStrings.loginSuccessMessage)
            } else {
                let errorMessage = self.getLocalizedErrorMessage(for: error)
                completion(errorMessage)
            }
        }
    }
    
    private func getLocalizedErrorMessage(for error: Error?) -> String {
        if let errorCode = (error as NSError?)?.code {
            switch errorCode {
            case AuthErrorCode.wrongPassword.rawValue:
                return loginStrings.wrongPasswordError
            case AuthErrorCode.userNotFound.rawValue:
                return loginStrings.userNotFoundError
            case AuthErrorCode.invalidEmail.rawValue:
                return loginStrings.invalidEmail
            default:
                return loginStrings.followError + (error?.localizedDescription ?? "")
            }
        } else {
            return loginStrings.followError + (error?.localizedDescription ?? "")
        }
    }
    
    private func validateEmailFormat(_ email : String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    
    public func validateFields(email: String , password: String) -> Bool {
        return (email.count >= 5 && password.count >= 4)
    }
}
