//
//  SignUpViewController.swift
//  Lesson 10
//
//  Created by  Alexander on 13.07.2020.
//  Copyright © 2020  Alexander. All rights reserved.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    //MARK:- Properties
    
    private let stackView = UIStackView()
    private let nameTextField = UITextField()
    private let surnameTextField = UITextField()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let signUpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Sign Up"
        
        allSetups()
        allConstraints()
    }
}

extension SignUpViewController {
    
    
    private func allSetups() {
        setupnameTextField()
        setupsurnameTextField()
        setuploginTextField()
        setuppasswordTextField()
        setupstackView()
        setupSignUpButton()
    }
    
    private func allConstraints() {
        setStackView()
        setSignUpButtonConstraints()
    }
    
    //MARK:- nameTextField settings
    
    private func setupnameTextField() {
        nameTextField.placeholder = "Name"
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK:- surnameTextField settings
    
    private func setupsurnameTextField() {
        surnameTextField.placeholder = "Surname"
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK:- loginTextField settings
    
    private func setuploginTextField() {
        loginTextField.placeholder = "Login"
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK:- passwordTextField settings
    
    private func setuppasswordTextField() {
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK:- stackView settings
    
    private func setupstackView() {
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 32
        
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(surnameTextField)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
    }
    
    private func setStackView() {
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    //MARK:- stackView settings
    
    private func setupSignUpButton() {
           signUpButton.backgroundColor = .systemBlue
           signUpButton.setTitle("Sign Up", for: .normal)
           signUpButton.setTitleColor(.white, for: .normal)
           signUpButton.layer.cornerRadius = 15
           
           signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
           
           view.addSubview(signUpButton)
       }
       
       @objc private func signUpButtonTapped() {
           show(UserInfoViewController(), sender: nil)
       }
       
       private func setSignUpButtonConstraints() {
           signUpButton.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
               signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
               signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
               signUpButton.heightAnchor.constraint(equalToConstant: 50)
           ])
       }
}
