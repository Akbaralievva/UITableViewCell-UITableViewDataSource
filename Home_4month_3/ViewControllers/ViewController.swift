//
//  ViewController.swift
//  Home_4month_3
//
//  Created by A LINA on 18/2/24.


import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    
    private let tableView = UITableView()
    
    
    private var contacts: [Contact] = []
    
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
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell2)
        
        setData()
    }
    
    
    private func setData(){
        contacts = [
            Contact(name: "Jane Cooper", phoneNumber: "(270) 555-0117", image: "1"),
            
            Contact(name: "Devon Lane", phoneNumber: "(308) 555-0121", image: "2"),
            
            Contact(name: "Darrell Steward", phoneNumber: "(684) 555-0102", image: "3"),
            
            Contact(name: "Devon Lane", phoneNumber: "(704) 555-0127", image: "4"),
            
            Contact(name: "Courtney Henry", phoneNumber: "(505) 555-0125", image: "5"),
            
            Contact(name: "Wade Warren", phoneNumber: "(225) 555-0118", image: "6"),
            
            Contact(name: "Bessie Cooper", phoneNumber: "(406) 555-0120", image: "7"),
            
            Contact(name: "Robert Fox", phoneNumber: "(480) 555-0103", image: "8"),
            
            Contact(name: "Jacob Jones", phoneNumber: "(702) 555-0122", image: "9"),
            
            Contact(name: "Jenny Wilson", phoneNumber: "(239) 555-0108", image: "10")
        ]
    }
    
    //

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
        
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.phoneNumber
        cell.imageView?.image = UIImage(named: contact.image)
        
        cell.layoutIfNeeded()
        
        if let imageView = cell.imageView {
            imageView.layer.cornerRadius = imageView.frame.size.width / 2
            imageView.clipsToBounds = true
        }
        
        return cell
    }
    
}
