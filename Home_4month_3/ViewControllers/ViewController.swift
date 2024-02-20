//
//  ViewController.swift
//  Home_4month_3
//
//  Created by A LINA on 18/2/24.


import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private let tableView = UITableView()
    private let idCell = "cell"
    private let idCell2 = "cell2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell2)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
        
        if indexPath.row % 2 == 0 {
            cell.textLabel?.text = "textLabel: \(indexPath.row)"
            cell.imageView?.image = UIImage(systemName: "star")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: idCell2, for: indexPath)
            cell.textLabel?.text = "textLable: \(indexPath.row)"
            cell.imageView?.image = UIImage(systemName: "car")
            return cell
        }
        
      
    }
}
