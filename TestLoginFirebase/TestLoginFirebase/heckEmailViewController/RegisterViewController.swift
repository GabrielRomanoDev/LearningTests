//
//  CheckEmailViewController.swift
//  TestLoginFirebase
//
//  Created by Gabriel Luz Romano on 22/05/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var emailTextField: PaddedTextField!
    @IBOutlet weak var emailPlaceholderLabel: UILabel!
    @IBOutlet weak var emailPlaceholderHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordStackView: UIStackView!
    @IBOutlet weak var passwordTextField: PaddedTextField!
    @IBOutlet weak var passwordPlaceholderLabel: UILabel!
    @IBOutlet weak var passwordPlaceholderHeightConstraint: NSLayoutConstraint!
    
    lazy var emailErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .red
        label.textAlignment = .justified
        label.numberOfLines = 2
        return label
    }()
    
    lazy var passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .red
        label.textAlignment = .justified
        label.numberOfLines = 2
        return label
    }()
    
    var statusEmailError: Bool = false
    var statusEmail: String = "ok"
    var statusPasswordError: Bool = false
    var statusPassword: String = "ok"
    
    static let identifier:String = String(describing: RegisterViewController.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        SetuptextFields()
        
    }
    
    @IBAction func tappedSignInButton(_ sender: UIButton) {
        let vc: LoginViewController? = UIStoryboard(name: LoginViewController.identifier, bundle: nil).instantiateViewController(withIdentifier: LoginViewController.identifier) as? LoginViewController
        present(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedContinue(_ sender: UIButton) {
        
        view.endEditing(true)
        
        statusEmail = validateEmailTextField()
        statusPassword = validatePasswordTextField()
        
        if statusEmail != "ok" {
            statusEmailError = true
            emailStackView.addArrangedSubview(emailErrorLabel)
            emailErrorLabel.text = statusEmail
            emailTextField.layer.borderWidth = 1
            emailTextField.layer.borderColor = UIColor.red.cgColor
            
        }
        
        if statusPassword != "ok" {
            statusPasswordError = true
            passwordStackView.addArrangedSubview(passwordErrorLabel)
            passwordErrorLabel.text = statusPassword
            passwordTextField.layer.borderWidth = 1
            passwordTextField.layer.borderColor = UIColor.red.cgColor
        }
        
        if statusEmail == "ok" && statusPassword == "ok" {
            
            //            let vc: RegisterViewController? = UIStoryboard(name: RegisterViewController.identifier, bundle: nil).instantiateViewController(withIdentifier: RegisterViewController.identifier) as? RegisterViewController
            //            present(vc ?? UIViewController(), animated: true)
            print(#function)
        }
        
    }
    
    private func SetuptextFields() {
        emailTextField.delegate = self
        emailTextField.textInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        emailTextField.autocorrectionType = .no
        emailTextField.textContentType = .emailAddress
        emailTextField.layer.cornerRadius = 5
        
        passwordTextField.delegate = self
        passwordTextField.textInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        passwordTextField.autocorrectionType = .no
        passwordTextField.textContentType = .emailAddress
        passwordTextField.layer.cornerRadius = 5
    }
    
    private func validateEmailTextField() -> String {
        let email: String = emailTextField.text ?? ""
        
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
    
    private func validatePasswordTextField() -> String {
        let password: String = passwordTextField.text ?? ""
        
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

extension RegisterViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            emailPlaceholderLabel.font = UIFont.systemFont(ofSize: 13)
            emailPlaceholderHeightConstraint.constant = 35
            
            if !statusEmailError {
                emailTextField.layer.borderWidth = 1
                emailTextField.layer.borderColor = UIColor.blue.cgColor
            }
            
        } else if textField == passwordTextField {
            passwordPlaceholderLabel.font = UIFont.systemFont(ofSize: 13)
            passwordPlaceholderHeightConstraint.constant = 35
            
            if !statusPasswordError {
                passwordTextField.layer.borderWidth = 1
                passwordTextField.layer.borderColor = UIColor.blue.cgColor
            }
        }
        
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == emailTextField {
            if statusEmailError {
                statusEmail = validateEmailTextField()
                
                if statusEmail == "ok" {
                    emailTextField.layer.borderColor = UIColor.systemGreen.cgColor
                    emailErrorLabel.removeFromSuperview()
                } else {
                    emailTextField.layer.borderColor = UIColor.red.cgColor
                    emailErrorLabel.text = statusEmail
                }
            }
        } else if textField == passwordTextField {
            if statusPasswordError {
                statusPassword = validatePasswordTextField()
                
                if statusPassword == "ok" {
                    passwordTextField.layer.borderColor = UIColor.systemGreen.cgColor
                    passwordErrorLabel.removeFromSuperview()
                } else {
                    passwordTextField.layer.borderColor = UIColor.red.cgColor
                    passwordErrorLabel.text = statusPassword
                }
            }
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            if textField == emailTextField {
                emailPlaceholderLabel.font = UIFont.systemFont(ofSize: 17)
                emailPlaceholderHeightConstraint.constant = 70
            } else if textField == passwordTextField {
                passwordPlaceholderLabel.font = UIFont.systemFont(ofSize: 17)
                passwordPlaceholderHeightConstraint.constant = 70
            }
            
        }
    }
    
    
}
