//
//  RegisterViewController.swift
//  TestLoginFirebase
//
//  Created by Gabriel Luz Romano on 22/05/23.
//

import UIKit

class CheckEmailViewController: UIViewController {
    
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
    
    var viewModel: CheckEmailViewModel = CheckEmailViewModel()
    
    var statusEmailError: Bool = false
    var statusEmail: String = ""
    
    static let identifier:String = String(describing: CheckEmailViewController.self)
    
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
        
        let email = emailTextField.text ?? ""
        
        statusEmail = viewModel.validateEmail(email: email)
        
        // O código passando direto por aqui, considerar colocar um timer!
        
        switch statusEmail {
        case "ok":
            let vc: RegisterViewController? = UIStoryboard(name: RegisterViewController.identifier, bundle: nil).instantiateViewController(identifier: RegisterViewController.identifier) {coder -> RegisterViewController? in
                return RegisterViewController(coder: coder, email: email)
            }
            present(vc ?? UIViewController(), animated: true)
        case "Email is already registered!":
            let vc: LoginViewController? = UIStoryboard(name: LoginViewController.identifier, bundle: nil).instantiateViewController(identifier: LoginViewController.identifier) {coder -> LoginViewController? in
                return LoginViewController(coder: coder, email: email)
            }
            present(vc ?? UIViewController(), animated: true)
        default:
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
}

extension CheckEmailViewController: UITextFieldDelegate {

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
            statusEmail = viewModel.validateEmail(email: emailTextField.text ?? "")
            
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
