//
//  Login.swift
//  MyBankApp
//
//  Created by user on 26/08/2021.
//

import UIKit

class Login: UIViewController {
  
  let logo: UIImageView = {
      let image = UIImageView(image: UIImage(named: "Carbon"))
      image.translatesAutoresizingMaskIntoConstraints = false
      image.contentMode = .scaleAspectFit
      return image
  }()
  
  private let signInButton: UIButton = {
      let button = UIButton()
      button.setTitle("Sign in", for: .normal)
      button.backgroundColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
      button.setTitleColor(.white, for: .normal)
      button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
      //        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
  }()
  
  let loginWelcomeLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Hi there, welcome back. Please sign in"
      return label
  }()
  
  let emailLabel: UILabel =  {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Email"
    return label
  }()
  
  let passwordLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Password"
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
  
  let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderWidth = 0
    textField.layer.borderColor = UIColor.gray.cgColor
    textField.layer.cornerRadius = 5
    textField.layer.backgroundColor = UIColor(red:239/255, green: 238/255, blue: 242/255, alpha: 1.0).cgColor
    return textField
  }()
  
  let newToCarbonLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "New to carbon?"
      return label
  }()
  
  let setUpNewAccountButton: UIButton = {
    let button = UIButton()
    button.setTitle("Set up new account", for: .normal)
    button.setTitleColor(UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00), for: .normal)
      button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
      button.addTarget(self, action: #selector(didTapNextButton) , for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
  }()
  
  override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
      layoutLogoView()
      layoutSignInButton()
  }

  private func layoutLogoView() {
      self.navigationController?.setNavigationBarHidden(true, animated: true)
      view.addSubview(logo)
      
      NSLayoutConstraint.activate([
          logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
          logo.heightAnchor.constraint(equalToConstant: 60),
          logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
          logo.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -100 )
      ])
      
  }

  private func layoutSignInButton() {
      signInButton.layer.cornerRadius = 8
      view.addSubview(signInButton)
      view.addSubview(loginWelcomeLabel)
      view.addSubview(emailLabel)
      view.addSubview(emailTextField)
      view.addSubview(passwordLabel)
      view.addSubview(passwordTextField)
      view.addSubview(newToCarbonLabel)
      view.addSubview(setUpNewAccountButton)

    NSLayoutConstraint.activate([
        signInButton.heightAnchor.constraint(equalToConstant: 52),
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        signInButton.bottomAnchor.constraint(equalTo: newToCarbonLabel.topAnchor, constant: -20),
        signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        
        loginWelcomeLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10),
        loginWelcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        emailLabel.topAnchor.constraint(equalTo: loginWelcomeLabel.bottomAnchor, constant: 10),
        emailLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
        
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
        emailTextField.heightAnchor.constraint(equalToConstant: 50),
        
        passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
        passwordLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
        
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
        passwordTextField.heightAnchor.constraint(equalToConstant: 50),
        
        newToCarbonLabel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -26),
        newToCarbonLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 40),
        
        setUpNewAccountButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
        setUpNewAccountButton.leftAnchor.constraint(equalTo: newToCarbonLabel.rightAnchor, constant: 3),
        //            setUpNewAccountButton.heightAnchor.constraint(equalToConstant: 50)
        
        
    ])
}

@objc func didTapNextButton(_ sender: UIButton) {
    // Move to the next screen
    let nextViewController = Login()
    navigationController?.pushViewController(nextViewController, animated: true)
}
}
