//
//  CarsListViewController.swift
//  Lesson 10
//
//  Created by  Alexander on 13.07.2020.
//  Copyright © 2020  Alexander. All rights reserved.
//

import UIKit

class CarsListViewController: UIViewController {

    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "Cars"
        
        setupTableView()
        setTableViewConstrains()
        view.addSubview(tableView)
    }
}

extension CarsListViewController {

    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setTableViewConstrains() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension CarsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }


}
