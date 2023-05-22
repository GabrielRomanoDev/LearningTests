//
//  RegisterViewController.swift
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
    
    var statusEmailError: Bool = false
    let statusEmail: String = "ok"
    
    static let identifier:String = String(describing: RegisterViewController.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        SetuptextFields()
       
    }
    

    @IBAction func tappedCloseButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func tappedGetStarted(_ sender: UIButton) {
        
        view.endEditing(true)
        
        let statusEmail: String = validateFields()
        
        if statusEmail == "ok" {
            print("sign in")
        } else {
            statusEmailError = true
            emailStackView.addArrangedSubview(emailErrorLabel)
            emailErrorLabel.text = statusEmail
            emailTextField.layer.borderColor = UIColor.red.cgColor
        }
        
    }
    
    private func SetuptextFields() {
        emailTextField.delegate = self
        emailTextField.textInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        emailTextField.autocorrectionType = .no
        emailTextField.textContentType = .emailAddress
        emailTextField.layer.cornerRadius = 5
    }
    
    private func validateFields() -> String {
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
    
    private func validateEmailFormat(_ email : String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
}

extension RegisterViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        emailPlaceholderLabel.font = UIFont.systemFont(ofSize: 13)
        emailPlaceholderHeightConstraint.constant = 35
        
        if !statusEmailError {
            emailTextField.layer.borderWidth = 1
            emailTextField.layer.borderColor = UIColor.blue.cgColor
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if statusEmailError {
            let statusEmail: String = validateFields()
            
            if statusEmail == "ok" {
                emailTextField.layer.borderColor = UIColor.systemGreen.cgColor
                emailErrorLabel.removeFromSuperview()
            } else {
                emailTextField.layer.borderColor = UIColor.red.cgColor
                emailErrorLabel.text = statusEmail
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            emailPlaceholderLabel.font = UIFont.systemFont(ofSize: 17)
            emailPlaceholderHeightConstraint.constant = 70
        }
    }
    
    
}
