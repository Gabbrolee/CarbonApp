//
//  SignUp.swift
//  MyBankApp
//
//  Created by user on 24/08/2021.
//

import UIKit
class SignUp: UIViewController {
  
  private let createAccountButton: UIButton = {
    let button = UIButton()
    button.setTitle("Create account", for: .normal)
    button.backgroundColor = UIColor(red: 0.29, green: 0.05, blue: 0.76 , alpha: 1.00)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
            button.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
    button.layer.cornerRadius = 5
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
     
  let signupWelcomeLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Let's set things up. Please fill out these basic\ndetails to get things started."
      label.numberOfLines = 2
      label.textAlignment = .center
      return label
  }()
  
  let firstNameLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "First Name"
    return label
  }()
  
  let firstNameTextField: UITextField = {
      let textField = UITextField()
      textField.translatesAutoresizingMaskIntoConstraints = false
      textField.layer.borderWidth = 0
      textField.layer.borderColor = UIColor.gray.cgColor
      textField.layer.cornerRadius = 5
      textField.layer.backgroundColor = UIColor(red: 239/255, green: 238/255, blue: 242/255, alpha: 1.0).cgColor
      return textField
  }()
   
  let middleNameLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Middle Name"
      return label
  }()
  
  let middleNameTextField: UITextField = {
      let textField = UITextField()
      textField.translatesAutoresizingMaskIntoConstraints = false
      textField.layer.borderWidth = 0
      textField.layer.borderColor = UIColor.gray.cgColor
      textField.layer.cornerRadius = 5
      textField.layer.backgroundColor = UIColor(red: 239/255, green: 238/255, blue: 242/255, alpha: 1.0).cgColor
      return textField
  }()
  
  let lastNameLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Last Name"
      return label
  }()
  
  let lastNameTextField: UITextField = {
      let textField = UITextField()
      textField.translatesAutoresizingMaskIntoConstraints = false
      textField.layer.borderWidth = 0
      textField.layer.borderColor = UIColor.gray.cgColor
      textField.layer.cornerRadius = 5
      textField.layer.backgroundColor = UIColor(red: 239/255, green: 238/255, blue: 242/255, alpha: 1.0).cgColor
      return textField
  }()
   
  let emailLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Email"
      return label
  }()
  
  let emailTextField: UITextField = {
      let textField = UITextField()
      textField.translatesAutoresizingMaskIntoConstraints = false
      textField.layer.borderWidth = 0
      textField.layer.borderColor = UIColor.gray.cgColor
      textField.layer.cornerRadius = 5
      textField.layer.backgroundColor = UIColor(red: 239/255, green: 238/255, blue: 242/255, alpha: 1.0).cgColor
      return textField
  }()
   
  let passwordLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Password"
      return label
  }()
  
  let passwordTextField: UITextField = {
      let textField = UITextField()
      textField.translatesAutoresizingMaskIntoConstraints = false
      textField.layer.borderWidth = 0
      textField.layer.borderColor = UIColor.gray.cgColor
      textField.layer.cornerRadius = 5
      textField.layer.backgroundColor = UIColor(red: 239/255, green: 238/255, blue: 242/255, alpha: 1.0).cgColor
      return textField
  }()
  
  let genderLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Gender"
      return label
  }()
  
  let genderTextField: UITextField = {
      let textField = UITextField()
      textField.translatesAutoresizingMaskIntoConstraints = false
      textField.layer.borderWidth = 0
      textField.layer.borderColor = UIColor.gray.cgColor
      textField.layer.cornerRadius = 5
      textField.layer.backgroundColor = UIColor(red: 239/255, green: 238/255, blue: 242/255, alpha: 1.0).cgColor
      return textField
  }()
  
  let phoneNumberLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Phone number"
      return label
  }()
  
  let phoneNumberTextField: UITextField = {
      let textField = UITextField()
      textField.translatesAutoresizingMaskIntoConstraints = false
      textField.layer.borderWidth = 0
      textField.layer.borderColor = UIColor.gray.cgColor
      textField.layer.cornerRadius = 5
      textField.layer.backgroundColor = UIColor(red: 239/255, green: 238/255, blue: 242/255, alpha: 1.0).cgColor
      return textField
  }()

  override func viewDidLoad() {
      self.navigationController?.setNavigationBarHidden(false, animated: true)
      super.viewDidLoad()
      view.backgroundColor = .white
      self.navigationItem.title = "Create your Carbon account"
      layoutSignUpPage()
      
}

  private func layoutSignUpPage() {
      view.addSubview(signupWelcomeLabel)
      view.addSubview(firstNameLabel)
      view.addSubview(firstNameTextField)
      view.addSubview(middleNameLabel)
      view.addSubview(middleNameTextField)
      view.addSubview(lastNameLabel)
      view.addSubview(lastNameTextField)
      view.addSubview(emailLabel)
      view.addSubview(emailTextField)
      view.addSubview(passwordLabel)
      view.addSubview(passwordTextField)
      view.addSubview(genderLabel)
      view.addSubview(genderTextField)
      view.addSubview(phoneNumberLabel)
      view.addSubview(phoneNumberTextField)

      view.addSubview(createAccountButton)
      
    NSLayoutConstraint.activate([
//            signupWelcomeLabel.topAnchor.constraint(equalTo: view.topAnchor),
        signupWelcomeLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
        signupWelcomeLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
        signupWelcomeLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),

        firstNameLabel.topAnchor.constraint(equalTo: signupWelcomeLabel.bottomAnchor, constant: 40),
        firstNameLabel.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor),
        
        firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 5),
        firstNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        firstNameTextField.widthAnchor.constraint(equalToConstant: 160),
        firstNameTextField.heightAnchor.constraint(equalToConstant: 50),
        
        middleNameLabel.topAnchor.constraint(equalTo: signupWelcomeLabel.bottomAnchor, constant: 40),
        middleNameLabel.leftAnchor.constraint(equalTo: middleNameTextField.leftAnchor),

        middleNameTextField.topAnchor.constraint(equalTo: middleNameLabel.bottomAnchor, constant: 5),
        middleNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
        middleNameTextField.widthAnchor.constraint(equalToConstant: 160),
        middleNameTextField.heightAnchor.constraint(equalToConstant: 50),
        
        lastNameLabel.topAnchor.constraint(equalTo: middleNameTextField.bottomAnchor, constant: 20),
        lastNameLabel.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor),

        lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 10),
        lastNameTextField.heightAnchor.constraint(equalToConstant: 50),
        lastNameTextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor),
        lastNameTextField.widthAnchor.constraint(equalToConstant: 355),
        
        emailLabel.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 20),
        emailLabel.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor),
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
        emailTextField.heightAnchor.constraint(equalToConstant: 50),
        emailTextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor),
        emailTextField.widthAnchor.constraint(equalToConstant: 355),
        
        passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
        passwordLabel.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor),
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
        passwordTextField.heightAnchor.constraint(equalToConstant: 50),
        passwordTextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor),
        passwordTextField.widthAnchor.constraint(equalToConstant: 355),
        
        genderLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
        genderLabel.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor),
        genderTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
        genderTextField.heightAnchor.constraint(equalToConstant: 50),
        genderTextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor),
        genderTextField.widthAnchor.constraint(equalToConstant: 355),
        
        phoneNumberLabel.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 20),
        phoneNumberLabel.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor),
        phoneNumberTextField.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10),
        phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50),
        phoneNumberTextField.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor),
        phoneNumberTextField.widthAnchor.constraint(equalToConstant: 355),

        createAccountButton.heightAnchor.constraint(equalToConstant: 52),
        createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        createAccountButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
        createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

    ])
  }

  @objc func didTapCreateAccount(_ sender: UIButton) {
      // Move to the next screen
      let nextViewController = PersonalDetailsViewController()
      navigationController?.pushViewController(nextViewController, animated: true)
  }
  
}
