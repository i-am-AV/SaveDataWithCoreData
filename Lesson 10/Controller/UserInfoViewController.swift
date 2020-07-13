//
//  UserInfoViewController.swift
//  Lesson 10
//
//  Created by  Alexander on 13.07.2020.
//  Copyright © 2020  Alexander. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    private let userInfoLabel = UILabel()
    private let showCarsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "User Info"
        
        allSetups()
        allConstraints()
    }
}

extension UserInfoViewController {
    
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
