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
    
    var viewModel: RegisterViewModel = RegisterViewModel()
    
    var statusEmailError: Bool = false
    var statusEmail: String = "ok"
    var statusPasswordError: Bool = false
    var statusPassword: String = "ok"
    var email: String
    
    static let identifier:String = String(describing: RegisterViewController.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    required init?(coder: NSCoder, email: String) {
        self.email = email
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetuptextFields()
        
    }
    
    @IBAction func tappedSignInButton(_ sender: UIButton) {
        let vc: LoginViewController? = UIStoryboard(name: LoginViewController.identifier, bundle: nil).instantiateViewController(identifier: LoginViewController.identifier) {coder -> LoginViewController? in
            return LoginViewController(coder: coder, email: "")
        }
        present(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedContinue(_ sender: UIButton) {
        view.endEditing(true)
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        statusEmail = viewModel.validateEmailTextField(email: email)
        statusPassword = viewModel.validatePasswordTextField(password: password)
        
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
            
            viewModel.createUser(email: email, password: password)
            print(#function)
        }
        
    }
    
    private func SetuptextFields() {
        emailTextField.delegate = self
        emailTextField.textInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        emailTextField.autocorrectionType = .no
        emailTextField.textContentType = .emailAddress
        emailTextField.layer.cornerRadius = 5
        emailTextField.text = email
        
        if emailTextField.text != "" {
            emailPlaceholderLabel.font = UIFont.systemFont(ofSize: 13)
            emailPlaceholderHeightConstraint.constant = 35
        }
        
        passwordTextField.delegate = self
        passwordTextField.textInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        passwordTextField.autocorrectionType = .no
        passwordTextField.textContentType = .emailAddress
        passwordTextField.layer.cornerRadius = 5
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
                statusEmail = viewModel.validateEmailTextField(email: textField.text ?? "")
                
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
                statusPassword = viewModel.validatePasswordTextField(password: textField.text ?? "")
                
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
