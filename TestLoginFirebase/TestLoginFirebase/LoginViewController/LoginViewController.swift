//
//  LoginViewController.swift
//  TestLoginFirebase
//
//  Created by Gabriel Luz Romano on 19/05/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var emailTextField: PaddedTextField!
    @IBOutlet weak var emailPlaceholderLabel: UILabel!
    @IBOutlet weak var emailPlaceholderHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailErrorIndicatorLine: UIView!
    @IBOutlet weak var passwordStackView: UIStackView!
    @IBOutlet weak var passwordTextField: PaddedTextField!
    @IBOutlet weak var passwordPlaceholderLabel: UILabel!
    @IBOutlet weak var passwordPlaceholderHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordErrorIndicatorLine: UIView!
    @IBOutlet weak var textFieldsDistanceConstraint: NSLayoutConstraint!
    @IBOutlet weak var signInButton: UIButton!
    
    lazy var emailErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .orange
        label.textAlignment = .justified
        label.numberOfLines = 2
        return label
    }()
    
    lazy var passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .orange
        label.textAlignment = .justified
        label.numberOfLines = 2
        return label
    }()
    
    static let identifier:String = String(describing: LoginViewController.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        SetuptextFields()
    }
    

    @IBAction func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func tappedSignInButton(_ sender: UIButton) {
        
        view.endEditing(true)
        
        if validateFields() {
            print("sign in")
        } else {
            if emailTextField.text?.count ?? 0 < 5 {
                emailStackView.addArrangedSubview(emailErrorLabel)
                emailErrorLabel.text = "Your email must contain beetween 5 and 60 characters."
                emailErrorIndicatorLine.isHidden = false
            } else if passwordTextField.text?.count ?? 0 < 4 {
                passwordStackView.addArrangedSubview(passwordErrorLabel)
                passwordErrorLabel.text = "Your password must contain beetween 4 and 60 characters."
                passwordErrorIndicatorLine.isHidden = false
            }
        }
    }
    
    private func setupButtons() {
        backButton.setTitle("", for: .normal)
        
        guard let originalImage = UIImage(named: "leftArrow") else {
            return
        }
        
        let targetSize = CGSize(width: 20, height: 20)
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0.0)
        originalImage.draw(in: CGRect(origin: .zero, size: targetSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let finalImage = resizedImage?.withRenderingMode(.alwaysTemplate)
        
        backButton.setImage(finalImage, for: .normal)
        backButton.tintColor = .white
        
        signInButton.layer.borderColor = UIColor.white.cgColor
        signInButton.layer.borderWidth = 1
        signInButton.layer.cornerRadius = 10
        signInButton.clipsToBounds = true
    }
    
    private func SetuptextFields() {
        emailTextField.delegate = self
        emailTextField.textInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        emailTextField.textContentType = .emailAddress
        emailTextField.autocorrectionType = .no
        
        passwordTextField.delegate = self
        passwordTextField.textInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        passwordTextField.autocorrectionType = .no
        
    }
    
    private func validateFields() -> Bool {
        if emailTextField.text?.count ?? 0 >= 5 && passwordTextField.text?.count ?? 0 >= 4 {
            return true
        } else {
            return false
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            emailPlaceholderLabel.font = UIFont.systemFont(ofSize: 13)
            emailPlaceholderHeightConstraint.constant = 35
        } else if textField == passwordTextField {
            passwordPlaceholderLabel.font = UIFont.systemFont(ofSize: 13)
            passwordPlaceholderHeightConstraint.constant = 35
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldsDistanceConstraint.constant = 20
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == emailTextField {
            emailErrorLabel.removeFromSuperview()
            emailErrorIndicatorLine.isHidden = true
        } else if textField == passwordTextField {
            passwordErrorLabel.removeFromSuperview()
            passwordErrorIndicatorLine.isHidden = true
        }
        
        if validateFields() {
            signInButton.backgroundColor = .red
            signInButton.clipsToBounds = true
        } else {
            signInButton.backgroundColor = .none
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textFieldsDistanceConstraint.constant = 140
            
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
