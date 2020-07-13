//
//  SignUpViewController.swift
//  Lesson 10
//
//  Created by  Alexander on 13.07.2020.
//  Copyright © 2020  Alexander. All rights reserved.
//

import UIKit
import CoreData

final class SignUpViewController: UIViewController {
    
    //MARK:- Properties
    
    private let stackView = UIStackView()
    private let nameTextField = UITextField()
    private let surnameTextField = UITextField()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let signUpButton = UIButton()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let count = usersCount(), count > 0 {
            show(UserInfoViewController(), sender: nil)
        }
        
        view.backgroundColor = .white
        navigationItem.title = "Sign Up"
        
        allSetups()
        allConstraints()
    
    }
    
    func usersCount() -> Int? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let user = try context.fetch(fetchRequest)
            return user.count
            
        } catch {
            print(error.localizedDescription)
            return nil
        }

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
        nameTextField.keyboardType = .namePhonePad
        nameTextField.returnKeyType = .continue
        nameTextField.clearButtonMode = .whileEditing
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK:- surnameTextField settings
    
    private func setupsurnameTextField() {
        surnameTextField.placeholder = "Surname"
        surnameTextField.keyboardType = .namePhonePad
        surnameTextField.returnKeyType = .continue
        surnameTextField.clearButtonMode = .whileEditing
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK:- loginTextField settings
    
    private func setuploginTextField() {
        loginTextField.placeholder = "Login"
        loginTextField.keyboardType = .namePhonePad
        loginTextField.returnKeyType = .continue
        loginTextField.clearButtonMode = .whileEditing
        loginTextField.autocorrectionType = .no
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK:- passwordTextField settings
    
    private func setuppasswordTextField() {
        passwordTextField.placeholder = "Password"
        passwordTextField.returnKeyType = .continue
        passwordTextField.clearButtonMode = .whileEditing
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
    
    //MARK:- signUpButton settings
    
    private func setupSignUpButton() {
        signUpButton.backgroundColor = .systemBlue
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.layer.cornerRadius = 15
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        view.addSubview(signUpButton)
    }
    
    @objc private func signUpButtonTapped() {
        
        if let name = nameTextField.text?.filter({ $0 != " "}), name != "",
            let surname = surnameTextField.text?.filter({ $0 != " "}), surname != "",
            let login = loginTextField.text?.filter({ $0 != " "}), login != "",
            let password = passwordTextField.text?.filter({ $0 != " "}), password != "" {
            
            saveUserInfo(name: name, surname: surname, login: login, password: password)
            
            show(UserInfoViewController(), sender: nil)
        } else {
            showErrorAlert()
        }
    }
    
    private func saveUserInfo(name: String, surname: String, login: String, password: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else {
            return
        }
        
        let userObject = User(entity: entity, insertInto: context)
        userObject.name = name
        userObject.surname = surname
        userObject.login = login
        userObject.password = password
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "Error",
                                      message: "Empty fields",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
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
