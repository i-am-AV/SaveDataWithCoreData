//
//  UserInfoViewController.swift
//  Lesson 10
//
//  Created by  Alexander on 13.07.2020.
//  Copyright © 2020  Alexander. All rights reserved.
//

import UIKit
import CoreData

class UserInfoViewController: UIViewController {
    
    private let userInfoLabel = UILabel()
    private let showCarsButton = UIButton()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configNavigation()
        
        allSetups()
        allConstraints()
        
        fetchRequest()
        
    }
}

extension UserInfoViewController {
    
    private func fetchRequest() {
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let user = try context.fetch(fetchRequest)
            
            if let name = user.first?.name,
               let surname = user.first?.surname,
               let login = user.first?.login,
                let password = user.first?.password {
                userInfoLabel.text = "\(name)\n\(surname)\n\(login)\n\(password)\n"
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func configNavigation() {
        navigationItem.title = "User Info"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addTapped))
    }
    
    @objc private func addTapped() {
        let alert = UIAlertController(title: "Add",
                                      message: nil,
                                      preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        let action = UIAlertAction(title: "Add",
                                   style: .default) { (action) in
                                    guard let textField = alert.textFields?.first else { return }
                                    
                                    print("Added car \(String(describing: textField.text!)) in Core data")
                                    
                                    guard let entity = NSEntityDescription.entity(forEntityName: "Car", in: self.context) else {
                                        return
                                    }
                                    
                                    let carObject = Car(entity: entity, insertInto: self.context)
                                    carObject.name = textField.text
                                    
                                    do {
                                        try self.context.save()
                                        print(carObject)
                                    } catch {
                                        print(error.localizedDescription)
                                    }
                                    
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func allSetups() {
        setupUserInfoLabel()
        setupSignUpButton()
    }
    
    private func allConstraints() {
        setuserInfoLabelConstraints()
        setSignUpButtonConstraints()
    }
    
    
    private func setupUserInfoLabel() {
        userInfoLabel.textAlignment = .center
        userInfoLabel.font = .systemFont(ofSize: 25)
        userInfoLabel.numberOfLines = 0
        
        view.addSubview(userInfoLabel)
    }
    
    private func setuserInfoLabelConstraints() {
        userInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            userInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userInfoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupSignUpButton() {
        showCarsButton.backgroundColor = .systemBlue
        showCarsButton.setTitle("Show cars list", for: .normal)
        showCarsButton.setTitleColor(.white, for: .normal)
        showCarsButton.layer.cornerRadius = 15
        
        showCarsButton.addTarget(self, action: #selector(showCarsButtonTapped), for: .touchUpInside)
        
        view.addSubview(showCarsButton)
    }
    
    @objc private func showCarsButtonTapped() {
        show(CarsListViewController(), sender: nil)
    }
    
    private func setSignUpButtonConstraints() {
        showCarsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showCarsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            showCarsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            showCarsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            showCarsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
